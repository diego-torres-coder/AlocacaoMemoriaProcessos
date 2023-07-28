#!/bin/bash

# Verifica se o diretório de logs existe
if [ ! -d logs ]
then
    mkdir logs
fi


obter_memoria_alocada() {
    # Obtém o número de processos que o usuário deseja verificar
    num_processos=$(bc <<< "$1+1")

    # Obtém os PIDs dos 10 processos que estão com maior quantidade de memória alocada
    pids=$(ps -e -o pid --sort -size | head -n $num_processos | grep [0-9])

    for pid in $pids
    do
        # TODO: Percorrer os PIDs e obter o nome de cada processo
        # Obtém o nome do processo desta iteração
        nome_processo=$(ps -p $pid -o comm=)

        # Obtém a data e a hora atual no formato aaaa-mm-dd,hh:mm:ss
        data_hora_atual=$(date +%F,%H:%M:%S,)

        # Redireciona a saída do echo para um arquivo de log com o nome do processo
        echo -n $data_hora_atual >> logs/$nome_processo.log

        # Memória alocada do processo em KB
        memoria_alocada_kb=$(ps -p $pid -o size | grep [0-9])

        # Memória alocada em MB
        memoria_alocada_mb="$(bc <<< "scale=2;$memoria_alocada_kb/1024") MB"

        # Acrescenta o valor de memória alocada do processo no respectivo arquivo de log
        echo $memoria_alocada_mb >> logs/$nome_processo.log
        
    done
}


# Chama a função para obter os 10 processos com maior memória alocada
obter_memoria_alocada $1

# Verifica o status de saída da função
if [ $? -eq 0 ]
then
    echo "Logs gerados com sucesso."
else
    echo "Houve um problema durante a geração dos logs."
fi
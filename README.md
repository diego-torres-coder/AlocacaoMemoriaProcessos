# Gerador de Logs de Memória Alocada por Processo

Este *script* nos permite verificar quais são os *n* processos do sistema que possuem maior quantidade de memória alocada. Por exemplo, o usuário pode estar interessado em saber quais são os 10 processos que mais estão consumindo memória. Para isso, ele pode executar o seguinte comando:

```bash
bash processos-memoria.sh 10
```

Ao executar este comando, o script irá gerar 10 arquivos de log, cada um com o nome do processo seguido da extensão `.log`. Assim, se o Google Chrome estiver entre os 10 processos, teremos um arquivo intitulado `chrome.log`.

Cada arquivo de log contém a data/hora em que o script foi executado e a memória alocada em MegaBytes (MB) para o processo. Por exemplo, no arquivo `chrome.log` poderíamos ter algo como:

```text
2023-07-28,08:52:16,497.16 MB
2023-07-28,08:52:16,398.14 MB
2023-07-28,08:52:16,278.17 MB
2023-07-28,08:52:17,195.42 MB
```

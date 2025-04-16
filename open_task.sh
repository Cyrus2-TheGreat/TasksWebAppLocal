#!/bin/bash

cd /home/andre-jr/Documents/HTML_APP/task_app/ || exit

# Inicia o servidor em segundo plano e guarda o PID
python3 -m http.server > /dev/null 2>&1 &
SERVER_PID=$!

# Aguarda um instante pra garantir que o servidor esteja pronto
sleep 1

# Abre o navegador
xdg-open http://localhost:8000/task.html

# Espera o usuário fechar o terminal manualmente para encerrar o servidor
# ou fica aguardando até que o processo seja terminado
wait $SERVER_PID

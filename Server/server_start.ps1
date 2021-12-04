# Задание
# 1. Запустить 2 скрипта, указать в них networks, получить результат

# Переход в рабочую директорию, где находится Dockerfile
cd C:\Users\Home\IdeaProjects\working\Docker\Server

# Сборка проекта
mvn clean package

# Остановка и удаление всех контейнеров, запущенных из образа server_image
docker rm -f $(docker ps -a -q --filter ancestor=server_image)

# Удаление образа server_image
docker rmi server_image

# Создание сети (bridge)
docker network rm server-client-network

# Сборка Docker образа
docker build . -t server_image

# Создание сети (bridge)
docker network create server-client-network

# Запуск Docker контейнера из собранного Docker образа для Server
docker run --name server -p 8081:8081 -d server_image

# Присоединение Docker контейнера (server) к сети
docker network connect --alias server server-client server

# Запуск скрипта client_start.ps1
C:\Users\Home\IdeaProjects\working\Docker\Client\client_start.ps1

# Оставить окно PowerShell открытым
powershell.exe -NoExit
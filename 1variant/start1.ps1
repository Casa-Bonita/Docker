# Задание
# 1. Запустить 2 скрипта, указать в них networks, получить результат (оба скрипта объединены в один)


# Остановка и удаление старых образов, контейнеров и сетей
# ---------------------------------------------------------------------------------------------

# Остановка и удаление всех контейнеров, запущенных из образа server_image
docker rm -f $(docker ps -a -q --filter ancestor=server_image)

# Удаление образа server_image
docker rmi server_image

# Удаление всех контейнеров, запущенных из образа client_image
docker rm -f $(docker ps -a -q --filter ancestor=client_image)

# Удаление образа client_image
docker rmi client_image

# Удаление сети server-client-network
docker network rm server-client


# Создание новых образов, контейнеров и сетей
# ---------------------------------------------------------------------------------------------

# Создание сети (bridge)
docker network create server-client

# Переход в рабочую директорию, где находится Server Dockerfile
cd C:\Users\Home\IdeaProjects\working\Docker\Server

# Сборка проекта Server
mvn clean package

# Сборка Docker образа для Server
docker build . -t server_image

# Запуск Docker контейнера из собранного Docker образа для Server
docker run --name server -p 8081:8081 -d server_image

# Присоединение Docker контейнера (server) к сети
docker network connect --alias server server-client server

# Переход в рабочую директорию, где находится Client Dockerfile
cd C:\Users\Home\IdeaProjects\working\Docker\Client

# Сборка проекта Client
mvn clean package

# Сборка Docker образа для Client
docker build . -t client_image

# Запуск Docker контейнера из собранного Docker образа для Client
docker run --name client -p 8080:8080 -d -e SERVER_URL=http://server:8081 client_image

# Присоединение Docker контейнера (client) к сети
docker network connect server-client client

# Оставить окно PowerShell открытым
powershell.exe -NoExit
# Задание
# 2. Запустить 2 скрипта, без "docker run", запустить docker compose (сделать в нём docker run)


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

# Удаление сети server-client
docker network rm server-client


# Создание новых образов, контейнеров и сетей
# ---------------------------------------------------------------------------------------------

# Создание сети (тип bridge)
docker network create server-client

# Переход в рабочую директорию, где находится Server Dockerfile
cd C:\Users\Home\IdeaProjects\working\Docker\Server

# Сборка проекта Server
mvn clean package

# Сборка Docker образа для Server
docker build . -t server_image

# Переход в рабочую директорию, где находится Client Dockerfile
cd C:\Users\Home\IdeaProjects\working\Docker\Client

# Сборка проекта Client
mvn clean package

# Сборка Docker образа для Client
docker build . -t client_image

# Переход в рабочую директорию, где находится Docker compose
cd C:\Users\Home\IdeaProjects\working\Docker\2variant

# Сборка docker-compose
docker-compose build

# Запуск docker-compose
docker-compose up

# Оставить окно PowerShell открытым
powershell.exe -NoExit
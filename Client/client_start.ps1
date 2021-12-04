# Задание
# 1. Запустить 2 скрипта, указать в них networks, получить результат

# Переход в рабочую директорию, где находится Dockerfile
cd C:\Users\Home\IdeaProjects\working\Docker\Client

# Сборка проекта
mvn clean package

# Удаление всех контейнеров, запущенных из образа client_image
docker rm -f $(docker ps -a -q --filter ancestor=client_image)

# Удаление образа client_image
docker rmi client_image

# Сборка Docker образа
docker build . -t client_image

# Запуск Docker контейнера из собранного Docker образа для Client
docker run --name client -p 8080:8080 -d -e SERVER_URL=http://server:8081 client_image

# Оставить окно PowerShell открытым
powershell.exe -NoExit
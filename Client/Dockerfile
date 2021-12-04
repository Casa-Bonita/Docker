FROM adoptopenjdk/openjdk11

ARG JAR_FILE=target/Client-0.0.1-SNAPSHOT.jar
RUN mkdir "/appdir"

COPY ${JAR_FILE} /appdir/app.jar

ENTRYPOINT ["java","-jar","/appdir/app.jar"]

EXPOSE 8080
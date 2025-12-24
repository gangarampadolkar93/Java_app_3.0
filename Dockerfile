FROM docker pull openjdk:27-ea-windowsservercore-ltsc2025
WORKDIR /app
COPY ./target/*.jar /app.jar
CMD ["java", "-jar", "/app.jar"]

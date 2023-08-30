# build
FROM maven:3.6.3-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
#?RUN mvn clean package
COPY src ./src
RUN mvn package -DskipTests

# get jar
FROM openjdk:11-slim
COPY --from=build /app/target/*.jar /app/app.jar
CMD ["java", "-jar", "/app/app.jar"]

# Create a stage for resolving and downloading dependencies.
FROM eclipse-temurin:17-jdk-focal

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

COPY src ./src

EXPOSE 8090

CMD ["./mvnw", "spring-boot:run"]
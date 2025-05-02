#FROM eclipse-temurin:17-jdk-alpine

# WORKDIR /app

# RUN mvn clean package -DskipTests




# COPY target/shopping-cart-spring-boot-main-0.0.1-SNAPSHOT.jar  app.jar

# EXPOSE 8081
# ENTRYPOINT ["java", "-jar", "app.jar"]

# Stage 1: Maven build
FROM maven:3.9.4-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the app
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]


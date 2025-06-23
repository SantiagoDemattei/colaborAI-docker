# Etapa 1: Build con OpenJDK 24 (JDK completo)
FROM openjdk:24-ea-20-jdk as builder

WORKDIR /app

# Copiamos archivos necesarios para compilar
COPY ../colaborai/pom.xml .
COPY ../colaborai/.mvn/ .mvn/
COPY ../colaborai/mvnw .
COPY ../colaborai/src ./src

# Damos permisos a mvnw para que pueda ejecutarse (solo si es necesario)
RUN chmod +x mvnw

# Compilamos el proyecto (sin tests para acelerar)
RUN ./mvnw clean package -DskipTests

# Etapa 2: Imagen runtime más ligera con OpenJDK 24 JRE
FROM openjdk:24-ea-20-jdk-jre

WORKDIR /app

# Copiamos el .jar construido en la etapa anterior
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

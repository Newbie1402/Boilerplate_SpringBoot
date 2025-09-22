# ===== Stage 1: Build =====
FROM maven:3.9.8-amazoncorretto-21 AS build
WORKDIR /app
COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 mvn -q -e -DskipTests dependency:go-offline
COPY src ./src
RUN --mount=type=cache,target=/root/.m2 mvn -q -e -DskipTests clean package

# ===== Stage 2: Runtime
FROM amazoncorretto:21.0.3

RUN yum install -y shadow-utils \
    && groupadd -r spring \
    && useradd -r -g spring spring \
    && yum clean all
USER spring:spring
WORKDIR /app
ARG JAR_FILE=/app/target/*.jar
COPY --from=build ${JAR_FILE} app.jar
ENV JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0 -XX:+ExitOnOutOfMemoryError"

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]


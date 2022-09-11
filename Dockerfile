FROM openjdk:18-slim
WORKDIR /app

# COPY build/libs/testing-web-0.0.1-SNAPSHOT.jar app.jar
COPY . /app

# RUN chmod +x ./gradlew
# RUN ./gradlew build -x jacocoTestReport test

# set a health check
HEALTHCHECK --interval=5s \
    --timeout=5s \
    CMD curl -f http://127.0.0.1:8080 || exit 1

EXPOSE 8080
ENTRYPOINT ["java","-jar","./build/libs/testing-web-0.0.1-SNAPSHOT.jar"]
# ENTRYPOINT ["java","-jar","/app/app.jar"]
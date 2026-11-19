FROM eclipse-temurin:17-jre-jammy

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY app.jar /app/app.jar

EXPOSE 9999
HEALTHCHECK --interval=15s --timeout=5s --start-period=30s --retries=5 \
    CMD curl --silent --output /dev/null http://127.0.0.1:9999/ || exit 1

ENTRYPOINT ["java", "-jar", "/app/app.jar"]

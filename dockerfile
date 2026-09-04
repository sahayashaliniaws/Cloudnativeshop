FROM amazoncorretto:17

WORKDIR /app

COPY target/cloudnativeshop-1.0.0.jar commerce.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "commerce.jar"]

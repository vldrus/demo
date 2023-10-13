FROM alpine:3.19 AS build

RUN apk update && apk add --no-cache tzdata ca-certificates openjdk21-jdk

WORKDIR /app

COPY . .

RUN sed   -i 's/\r//g' mvnw
RUN chmod +x           mvnw

RUN ./mvnw clean package

FROM alpine:3.19 AS image

RUN apk update && apk add --no-cache tzdata ca-certificates openjdk21-jre

COPY --from=build /app/target/demo.jar /app.jar

EXPOSE 8080

ENTRYPOINT java -jar /app.jar

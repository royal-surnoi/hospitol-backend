FROM alpine/java:21-jdk

RUN addgroup app && adduser -S -G app app

WORKDIR /home/app

COPY --chown=app:app /target/HospitalAppointment-0.0.1-SNAPSHOT.jar /home/app/
EXPOSE 8080

HEALTHCHECK CMD curl --fail http://localhost:8080/healthcheck

CMD ["nohup","java","-jar","FusionIQ-0.0.1-SNAPSHOT.jar","&"]


FROM won983212/pinpoint-agent-jdk-11

WORKDIR /usr/app/

COPY build/libs/*.jar application.jar

EXPOSE 8080

ENTRYPOINT java -XX:+HeapDumpOnOutOfMemoryError -Duser.timezone="Asia/Seoul" -jar\
    -javaagent:./pinpoint/pinpoint-bootstrap-2.5.0.jar\
    -Dpinpoint.agentId=dev\
    -Dpinpoint.applicationName=$AGENT_NAME\
    -Dpinpoint.config=./pinpoint/pinpoint-root.config\
    application.jar\
    --spring.config.location=file:///usr/app/application.yml
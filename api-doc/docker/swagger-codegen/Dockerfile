FROM maven:3.3-jdk-7

ENV TAG v2.1.4

VOLUME /root/.m2/repository

RUN apt-get install git

WORKDIR /opt
RUN git clone https://github.com/swagger-api/swagger-codegen.git

WORKDIR /opt/swagger-codegen
RUN git reset --hard ${TAG}
RUN mvn package

ENTRYPOINT ["java", "-jar", "/opt/swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar"]

CMD ["help"]

# docker run -v /Users/yewton/Development/rmp-remi/suzu-server:/src -v /Users/yewton/Workspace/gen:/gen zexykitchen/swagger-codegen generate -i /src/tmp/build-doc/stg/swagger.yml -l nodejs -t /src/swagger/codegen/templates/nodejs -o /gen

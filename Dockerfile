FROM tomcat:9.0.65-jdk11

RUN wget --user=admin --password=admin1 http://13.233.154.198:8081/repository/demo/com/mt/MavenEnterpriseApp-web/1.0/MavenEnterpriseApp-web-1.0.war

ADD ./MavenEnterpriseApplication-web-1.0.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD [“catalina.sh”, “run”]

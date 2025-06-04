FROM tomcat:9.0
COPY ./job-portal-system/target/job-portal-system.war /usr/local/tomcat/webapps/
EXPOSE 8080

# Base image - Tomcat 9
FROM tomcat:9.0

# WAR file
COPY ./target/job-portal-system.war /usr/local/tomcat/webapps/

# Port (Tomcat default 8080)
EXPOSE 8080
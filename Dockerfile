FROM tomcat:8-jre8

MAINTAINER David Tiselius <david.tiselius@gmail.com>

ENV SL_VERSION 1.2.3.RELEASE
ENV SL_FILE springloaded-${SL_VERSION}.jar
ENV SL_URL http://repo.spring.io/simple/libs-release-local/org/springframework/springloaded/${SL_VERSION}/${SL_FILE}

RUN curl -fSL "${SL_URL}" -o $SL_FILE
ADD tomcat-users.xml /usr/local/tomcat/conf/

ENV JAVA_OPTS "${JAVA_OPTS} -javaagent:${CATALINA_HOME}/${SL_FILE} -noverify"

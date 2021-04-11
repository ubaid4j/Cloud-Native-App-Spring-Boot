Install Docker
==============
- [For Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [For Mac](https://docs.docker.com/docker-for-mac/install/)
- [For Windows](https://docs.docker.com/docker-for-windows/install/)


Install Maven and JDK-16 
=======================
- For Linux, simply run the command `./install-maven-jdk16.sh`. It will install `OpenJDK 16` and `Maven 3.8.1`
- For Mac
  - Download [JDK-16 tar.gz from jdk.java.net](https://download.java.net/java/GA/jdk16/7863447f0ab643c585b9bdebf67c69db/36/GPL/openjdk-16_osx-x64_bin.tar.gz)
  - Extract it and set `JAVA_HOME` by running `export JAVA_HOME=/path/to/extracted/jdk16/tar`
  - Install the latest [Maven 3.8.1](https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz)
  - Set MAVEN_HOME and M2_HOME and are pointing to maven-3.8.1 root directory
- For Windows
  - Download [JDK-16 tar.gz from jdk.java.net](https://download.java.net/java/GA/jdk16/7863447f0ab643c585b9bdebf67c69db/36/GPL/openjdk-16_windows-x64_bin.zip)
  - Extract it and set `JAVA_HOME` using `Environment Variable`
  - Install the latest [Maven 3.8.1](https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz)
  - Set `MAVEN_HOME` and `M2_HOME` using `Environment Variable`
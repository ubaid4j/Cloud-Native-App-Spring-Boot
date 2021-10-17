Install Docker
==============
- [For Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [For Mac](https://docs.docker.com/docker-for-mac/install/)
- [For Windows](https://docs.docker.com/docker-for-windows/install/)


Install Maven and JDK-17
=======================
- For Linux, simply run the command `./install-maven-jdk17.sh`. It will install `OpenJDK 17` and `Maven 3.8.3`. If you are still seeing the old JDK when executing `mvn --version` then please execute `export JAVA_HOME=/opt/custom-ubaid/java`
- For Mac
  - Download [JDK-17 tar.gz from jdk.java.net](https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_macos-x64_bin.tar.gz)
  - Extract it and set `JAVA_HOME` by running `export JAVA_HOME=/path/to/extracted/jdk16/tar`
  - Install the latest [Maven 3.8.3](https://downloads.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz)
  - Set MAVEN_HOME and M2_HOME and are pointing to maven-3.8.1 root directory
- For Windows
  - Download [JDK-17 zip from jdk.java.net](https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_windows-x64_bin.zip)
  - Extract it and set `JAVA_HOME` using `Environment Variable`
  - Install the latest [Maven 3.8.3](https://downloads.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz)
  - Set `MAVEN_HOME` and `M2_HOME` using `Environment Variable`
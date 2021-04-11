wget https://download.java.net/java/GA/jdk16/7863447f0ab643c585b9bdebf67c69db/36/GPL/openjdk-16_linux-x64_bin.tar.gz -P /tmp
sudo rm -rf jdk-16
sudo tar -xvf /tmp/openjdk-16_linux-x64_bin.tar.gz -C /opt
sudo rm -rf /opt/java
sudo ln -s /opt/jdk-16 /opt/java
wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz -P /tmp
sudo rm -rf /opt/maven-3.8.1
sudo tar -xvf /tmp/apache-maven-3.8.1-bin.tar.gz -C /opt
sudo rm -rf /opt/maven
sudo ln -s /opt/apache-maven-3.8.1 /opt/maven
sudo sh -c "echo export JAVA_HOME=/opt/java  export MAVEN_HOME=/opt/maven  export M2_HOME=/opt/maven export PATH=${M2_HOME}/bin:${PATH} >> /etc/profile.d/maven.sh"
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn --version
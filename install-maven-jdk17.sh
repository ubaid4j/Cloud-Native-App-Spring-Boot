#creating custom directory for jdk-17 and maven 3.8.3
sudo mkdir /opt/custom-ubaid
#Deleting Symbolic Links and custom profile for maven
sudo rm -rf /opt/custom-ubaid/java
sudo rm -rf /opt/custom-ubaid/maven
sudo rm -rf /usr/bin/mvn
sudo rm -rf /usr/bin/java
sudo rm -rf /etc/profile.d/custom-ubaid-maven.sh

# Downloading jdk-17 and extracting
wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz -P /tmp
sudo tar -xvf /tmp/openjdk-17_linux-x64_bin.tar.gz -C /opt/custom-ubaid
sudo ln -s /opt/custom-ubaid/jdk-17 /opt/custom-ubaid/java

# Downloading maven 3.8.3 and extracting
wget https://downloads.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz -P /tmp
sudo tar -xvf /tmp/apache-maven-3.8.3-bin.tar.gz -C /opt/custom-ubaid
sudo ln -s /opt/custom-ubaid/apache-maven-3.8.3 /opt/custom-ubaid/maven

# Creating custom maven profile to point to jdk-17
sudo sh -c "echo export JAVA_HOME=/opt/custom-ubaid/java  export MAVEN_HOME=/opt/custom-ubaid/maven  export M2_HOME=/opt/custom-ubaid/maven export PATH=/opt/custom-ubaid/maven/bin:${PATH} >> /etc/profile.d/custom-ubaid-maven.sh"
sudo chmod +x /etc/profile.d/custom-ubaid-maven.sh

# Creating symbolic link for maven and java
sudo ln -s /opt/custom-ubaid/maven/bin/mvn /usr/bin/mvn
sudo ln -s /opt/java/bin/java /usr/bin/java

# Check mvn version
source /etc/profile.d/custom-ubaid-maven.sh
export JAVA_HOME=/opt/custom-ubaid/java
mvn --version

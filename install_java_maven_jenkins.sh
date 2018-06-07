#Install Java
sudo apt-get update
sudo apt-get install default-jdk -y
echo "JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"" >> /etc/environment
source /etc/environment
echo $JAVA_HOME

#Install maven
sudo apt-get update -y
sudo apt-get upgrade -y
cd /usr/share
wget http://redrockdigimark.com/apachemirror/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
sudo tar -xvzf apache-maven-3.5.3-bin.tar.gz
sudo mv apache-maven-3.5.3 maven
rm apache-maven-3.5.3-bin.tar.gz
echo /etc/profile.d/mavenenv.sh > export M2_HOME=/usr/share/maven export PATH=${M2_HOME}/bin:${PATH}
sudo chmod +x /etc/profile.d/mavenenv.sh
sudo source /etc/profile.d/mavenenv.sh
mvn --version

#Install jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

FROM ubuntu
MAINTAINER "ranjit"
#Install git
RUN apt-get update \        
     apt-get install -y git
RUN mkdir /home/sampleTest \      
           cd /home/sampleTest \        
           git clone https://github.com/jagadish12/SampleTest.git
#Set working directory
WORKDIR /home/sampleTest

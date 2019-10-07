# Ubuntu Fork-Bomb Dockerfile
# Installs all dependencies required on a Linux ARM 64 Ubuntu system to be able to run a fork bomb

# Pulls base image
FROM ubuntu:18.04

# Install
RUN \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install vim && \
    apt-get -y install build-essential

# Add files.
#ADD root/.bashrc /root/.bashrc
#ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

COPY . /root

EXPOSE 80

# Use Clang to compile the Test.cpp source file
RUN gcc forkBomb.c -o forkBomb
 
# Run the output program from the previous step
CMD ["./forkBomb"]

#COPY docker-start.sh /usr/local/bin/
#RUN ln -s /usr/local/bin/docker-start.sh
#ENTRYPOINT ["docker-start.sh"]

# Define default command.
#CMD ["bash"]

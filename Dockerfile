FROM golang:1.11.1

#Versions
ENV DOCKER_CLI_VER 17.12.1-ce
ENV NODE_VER 10.x
ENV NPM_VER 6

# Setup
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VER | bash -
RUN apt-get update

# Node.js
RUN apt-get install -y nodejs postgresql-client netcat
RUN npm install -g npm@$NPM_VER

# godotenv
RUN go get github.com/joho/godotenv/cmd/godotenv
RUN go get github.com/magefile/mage

# Docker CLI
RUN curl -L -o /tmp/docker-$DOCKER_CLI_VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLI_VER.tgz \
    && tar -xz -C /tmp -f /tmp/docker-$DOCKER_CLI_VER.tgz \
    && mv /tmp/docker/* /usr/bin
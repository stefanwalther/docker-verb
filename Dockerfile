FROM node:7.10

MAINTAINER Stefan Walther <swr-nixda@gmail.com>

# Global install yarn package manager && finally remove unnecessary packages
RUN apt-get update && apt-get install -y curl apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn && \
    apt-get autoremove

RUN yarn global add verbose/verb#dev verbose/verb-generate-readme
RUN yarn

WORKDIR /app

CMD ["verb"]

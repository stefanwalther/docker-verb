ARG NODE_VER="14"
#LABEL authors="Stefan Walther"

# -------------------------------------------------------------------
#                               BASE NODE
# -------------------------------------------------------------------
# We need full node as we need git to download from some GitHub repos.
# -------------------------------------------------------------------
# We cannot use -alpine straight ahead since we need the git package.
FROM node:${NODE_VER} as base

WORKDIR /opt/verb

RUN npm install -g verbose/verb#dev verbose/verb-generate-readme

## -------------------------------------------------------------------
##                                TEST
## -------------------------------------------------------------------
FROM base as test

RUN mkdir /opt/verb/test
COPY ./test /opt/verb/test
RUN ./test/test-verb.sh

## -------------------------------------------------------------------
##                                RELEASE
## -------------------------------------------------------------------
FROM node:${NODE_VER}-alpine as release

RUN apk update
RUN apk add bash

# Enables colored output
ENV FORCE_COLOR=true

WORKDIR /opt/verb

# OK, here we have to copy the symbolic link
# use npm config get prefix to get the node.js prefix https://stackoverflow.com/questions/18383476/how-to-get-the-npm-global-path-prefix
# COPY --from=BASE /usr/local/bin/verb /usr/local/bin/verb

# Create the symbolic link
RUN ln -s /usr/local/lib/node_modules/verb/bin/verb.js /usr/local/bin/verb

# Copy the global packages previously being installed
COPY --from=base /usr/local/lib/node_modules /usr/local/lib/node_modules

ADD ./scripts/start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]

# Fix
#RUN rm -f ./README.md
#CMD ["verb"]

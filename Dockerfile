# -------------------------------------------------------------------
#                               BASE NODE
# -------------------------------------------------------------------
# We need full node as we need git to download from some GitHub repos.
# -------------------------------------------------------------------
FROM node:8.4.0 as BASE

WORKDIR /opt/verb

RUN npm install -g verbose/verb#dev verbose/verb-generate-readme

## -------------------------------------------------------------------
##                                RELEASE
## -------------------------------------------------------------------
FROM node:8.4.0-alpine as RELEASE

WORKDIR /opt/verb

# OK, here we have to copy the symbolic link
# use npm config get prefix to get the node.js prefix https://stackoverflow.com/questions/18383476/how-to-get-the-npm-global-path-prefix
# COPY --from=BASE /usr/local/bin/verb /usr/local/bin/verb
RUN ln -s /usr/local/lib/node_modules/verb/bin/verb.js /usr/local/bin/verb

COPY --from=BASE /usr/local/lib/node_modules /usr/local/lib/node_modules

CMD ["verb"]

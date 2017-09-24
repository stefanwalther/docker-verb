# docker-verb

> Run verb on Docker.

[![CircleCI](https://img.shields.io/circleci/project/github/stefanwalther/docker-verb.svg)](https://circleci.com/gh/stefanwalther/docker-verb/tree/master)
[![](https://images.microbadger.com/badges/image/stefanwalther/verb.svg)](https://microbadger.com/images/stefanwalther/verb "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/stefanwalther/verb.svg)](https://microbadger.com/images/stefanwalther/verb "Get your own version badge on microbadger.com")
## Table of Contents

<details>

- [Motivation](#motivation)
- [Run](#run)
- [Configuration](#configuration)
- [Recipes](#recipes)
  * [Watching doc changes](#watching-doc-changes)
  * [Run only if necessary](#run-only-if-necessary)
- [Installation](#installation)
  * [Prerequisites](#prerequisites)
- [Known Issues](#known-issues)
- [Changelog](#changelog)
- [About](#about)
  * [Author](#author)
  * [Contributing](#contributing)
  * [License](#license)

_(TOC generated by [verb](https://github.com/verbose/verb) using [markdown-toc](https://github.com/jonschlinkert/markdown-toc))_

</details>

## Motivation

[verb](https://github.com/verbose/verb) is a great solution to document projects, create README files, enter [README driven development](https://www.google.de/search?q=readme+driven+development).
This project helps to make it even easier to use by "dockerizing" verb.

___(By using this solution you do not need to install verb as a global node.js package anymore)___

## Run

```sh
$ docker run --rm -v ${PWD}:/opt/verb stefanwalther/verb
```

What does actually happen here?

- A docker container using the given solution will be spinned up
- `-v` mounts the current directory to the docker container
- Finally, after the container has been built, `verb` will be executed (and the container being destroyed)

## Configuration

I recommend to add a task into your `package.json` file, which triggers the creation of your README.md file

```json
{
  "name": "Your Repo",
  "scripts": {
    "docs": "docker run --rm -v ${PWD}:/opt/verb stefanwalther/verb"
  }
}
```

Then, whenever you want to generate your docs, run:

```sh
$ npm run docs
```

## Recipes

Some recipes I have come up over time, using verb nearly on a daily basis.

### Watching doc changes

If you want to auto-build your docs whenever you make changes, there is a pretty neat way to achieve that:

1) Install [nodemon](https://nodemon.io/)

```bash
$ npm install -g nodemon
```

2) Add a watch script to your package.json
```bash
"scripts": {
    "docs": "docker run --rm -v ${PWD}:/opt/verb stefanwalther/verb",
    "docs:watch": "nodemon --config ./nodemon.json --exec 'yarn' docs"
  },
```

3) Add a nodemon.json config file to your root dir:

```json
{
  "ext": "md",
  "verbose": false,
  "ignore": [
    "README.md"
  ],
  "watch": [
    ".verb.md",
    "docs"
  ]
}
```

4) Run docs:watch

```bash
$ npm run docs:watch
```

If you are not making any changes to either .verb or any document in ./docs, then your README.md will be re-generated.

### Run only if necessary

If you commit often, you don't want to miss when to run verb, but on the other hand I don't want to run it if not necessary.
This is how I manged to achieve this goal:

1) First of all I use [husky](https://github.com/typicode/husky) to be able to add git hooks (precommit, prepublish, etc.)
2) I combine a `prepush` hook with a custom script which just figures out if running verb is necessary (in this case only if there are changes in the `.verb` file or if anything has changed in the `./docs/` directory).

_package.json:_
```sh
  "scripts": {
    "docs-if-necessary": "./scripts/docs-if-necessary.sh",
    "docs": "docker run --rm -v ${PWD}:/opt/verb stefanwalther/verb",
    "prepublish": "npm run docs-if-necessary"
  }
```

_./scripts/docs-if-necessary.sh:_
```sh
#!/usr/bin/env bash

if (git status | grep -E "docs/|.verb.md" -q);
then
  npm run docs;
  
  # Stop the push
  # Note: Instead of exiting you could even go one step further and 
  # automatically git commit the newly created README.md. I have
  # experimented with that, but didn't really like it.
  exit 10; 
  
fi
```

## Installation

### Prerequisites

- [Docker for Mac](https://docs.docker.com/docker-for-mac/) / [Docker for Windows](https://docs.docker.com/docker-for-windows/)

## Known Issues

... none known so far ...

## Changelog

See [CHANGELOG file](CHANGELOG.yml)

## About

### Author

**Stefan Walther**

* [twitter](http://twitter.com/waltherstefan)  
* [github.com/stefanwalther](http://github.com/stefanwalther) 
* [LinkedIn](https://www.linkedin.com/in/stefanwalther/) 
* [qliksite.io](http://qliksite.io)

### Contributing

Pull requests and stars are always welcome. For bugs and feature requests, [please create an issue](https://github.com/stefanwalther/docker-verb/issues). The process for contributing is outlined below:

1. Create a fork of the project
2. Work on whatever bug or feature you wish
3. Create a pull request (PR)

I cannot guarantee that I will merge all PRs but I will evaluate them all.

### License
Copyright © 2017, Stefan Walther.
 
MIT


# docker-verb

> Run verb on Docker.

[![CircleCI](https://circleci.com/gh/stefanwalther/docker-verb.svg?style=svg)](https://circleci.com/gh/stefanwalther/docker-verb)

## Motivation

[verb](https://github.com/verbose/verb) is a great solution to document projects, create README files, enter [README driven development](https://www.google.de/search?q=readme+driven+development).
This project helps to make it even easier to use by "dockerizing" verb.

___(By using this solution you do not need to install verb as a global node.js package anymore)___

## Run

```sh
$ docker run -v ${PWD}:/opt/verb stefanwalther/verb
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
    "docs": "docker run -v ${PWD}:/opt/verb stefanwalther/verb"
  }
}
```

Then, whenever you want to generate your docs, run:

```sh
$ npm run docs
```

or (using [yarn](https://yarnpkg.com))   

```sh
$ yarn docs
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

* [stefanwalther.io](http://stefanwalther.io)
* [qliksite.io](http://qliksite.io)
* [qlikblog.at](http://qlikblog.at)
* [github/stefanwalther](https://github.com/stefanwalther)
* [twitter/waltherstefan](http://twitter.com/waltherstefan)
* [LinkedIn](https://www.linkedin.com/in/stefanwalther/)

### Contributing

Pull requests and stars are always welcome. For bugs and feature requests, [please create an issue](https://github.com/stefanwalther/docker-verb/issues). The process for contributing is outlined below:

1. Create a fork of the project
2. Work on whatever bug or feature you wish
3. Create a pull request (PR)

I cannot guarantee that I will merge all PRs but I will evaluate them all.

### License
Copyright © 2017, Stefan Walther.
 
MIT


# Docker Sample

Sample Docker files for composing a LEMP stack.

## Requirements

You must have Docker CE installed locally.\
Check out more instructions at [Docker documentation](https://docs.docker.com/install/).

## Installation

To use these bootstrap files you can `git clone` this repository directly, or download the zipped content.

## Usage

Once you have the files inside your project, you can run `docker-compose up -d` using bash. It will take a longer time to boot up at the first time, as Docker will pull all images and build PHP before run.

**Important**: The ports **80** and **33060** must be free in your localhost. Otherwise, docker won`t run.

## To do

- All production flow (started from `docker-compose.prod.yml`) is **not** tested. Constributions are always welcome.

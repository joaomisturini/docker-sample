#!/usr/bin/env bash

docker run --rm --volume $(pwd):/app composer $@

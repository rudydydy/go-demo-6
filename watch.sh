#!/usr/bin/env bash

# watch the go files and continously deploy the service
make linux
UUID=$(uuidgen) skaffold run -p dev
reflex -r "\.go$" -- bash -c 'make linux && UUID=$(uuidgen) skaffold run -p dev'

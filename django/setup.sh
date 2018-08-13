#!/bin/bash

# checks for existance of binary with provided name
# and exits script with 1 if it is not present
required_binary() {
    BINARY_NAME=$1
    command -v $BINARY_NAME > /dev/null || (echo "$BINARY_NAME not found" && exit 1)
}

prepare_virtualenv() {
    if [[ ! -f bin/activate ]]; then
        virtualenv .
    fi
    source bin/activate
}

install_django() {
    if ! python3 -m django --version > /dev/null ; then
        pip install Django
    fi
}

set -e      # exit if required binary not found
required_binary "virtualenv"
required_binary "pip"
prepare_virtualenv
install_django
echo "Finished setup. Please source bin/activate to activate virtual environment."
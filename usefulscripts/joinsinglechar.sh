#!/bin/bash

joinchar() {
    paste -d "$2" -s "$1"
}

joinchar "$@"

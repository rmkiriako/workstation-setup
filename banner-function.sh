#!/usr/bin/env bash

function banner() {
    TEXT=$1
    SIZE=${#TEXT}

    NUMBER_OF_HASHES=$(($SIZE + 10))

    # print an empty line
    echo

    # print a row of hashes
    COUNTER=0
    while [  $COUNTER -lt $NUMBER_OF_HASHES ]; do
        echo -n "#" 
        let COUNTER=COUNTER+1 
    done
    echo

    # print a row with one hash at the beginning and end
    echo -n "#"
    COUNTER=2
    while [  $COUNTER -lt $NUMBER_OF_HASHES ]; do
        echo -n " "
        let COUNTER=COUNTER+1
    done
    echo -n "#"
    echo

    # print the input text with a hash at the begining and end
    echo -n "#    "
    echo -n $TEXT
    echo -n "    #"
    echo

    # print a row with one hash at the beginning and end
    echo -n "#"
    COUNTER=2
    while [  $COUNTER -lt $NUMBER_OF_HASHES ]; do
        echo -n " "
        let COUNTER=COUNTER+1
    done
    echo -n "#"
    echo

    # print a row of hashes
    COUNTER=0
    while [  $COUNTER -lt $NUMBER_OF_HASHES ]; do
        echo -n "#"
        let COUNTER=COUNTER+1
    done
    echo

    # print an empty line
    echo
}


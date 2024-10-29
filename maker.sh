#!/bin/bash
#this script makes a make file
#takes the files needed as an input

usage () {
        echo "Usage:">&2
        echo "maker \"file1.c file2.c file2.h...\" \"executable\"">&2
}

if [[ $# != 2 ]]
then
        echo "Not the Right Amount of Arguments">&2
        usage
elif [[ -z $1 || -z $2 ]]
then
        echo "One of the arguments is empty">&2
        usage
else
        touch makefile
        if [[ -f "makefile" ]]
        then
                echo "$2: $1
        gcc -o $2 $1" >> makefile
        else
                echo "
                $2: $1
        gcc -o $2 $1" >> makefile
        fi
fi
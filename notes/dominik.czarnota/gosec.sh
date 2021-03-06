#!/bin/bash
if [ "$1" != "" ]
then
    ns=$1
else
    echo "usage: [namespace]"
    exit
fi

# You can just do:
# go get whatever.io/whatever
# go_vet_less_horrible.sh whatever.io/whatever
#
# and it should Just Work(TM) 
# 
# void where prohibited 
# must be 18 years or older
# kids ask your parents' permission before using

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for i in cmd/*
do
    if [ -d "$i" ]
    then
        echo "running $ns/$i"
        ~/go/bin/gosec -conf ${DIR}/gosec_config.json $ns/$i 2>&1 | tee -a gosec.log
    fi
done

#!/bin/bash

set -e

echo " hello" 
export DBUSER=test

export DBHOST=172.17.0.1

export DBPASS=test

export DBNAME=test

flask db upgrade

flask run -h 0.0.0.0 -p 5000

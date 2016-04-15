#!/usr/bin/env bash

set -e

psql  -U postgres -p 5432 postgres -c "CREATE DATABASE database_name;"

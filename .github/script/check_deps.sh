#!/bin/sh

VALIDATOR='flutter pub outdated --no-dev-dependencies --up-to-date --no-dependency-overrides'
ERROR_STRING='flutter pub upgrade --major-versions'

if $VALIDATOR | grep -q "$ERROR_STRING"; then
   exit 1
fi

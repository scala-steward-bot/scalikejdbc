#!/bin/bash

set -eux

sbt -v \
  '++ 2.12.13! -v' \
  publishLocal \
  '++ 2.13.5! -v' \
  "project root213" \
  publishLocal

sbt -v \
  -J-XX:+CMSClassUnloadingEnabled \
  -J-Xmx512M \
  -J-Xms512M \
  "project mapper-generator" \
  scripted

#!/bin/bash
# Builds the brain-extraction container.
# The container can be exported using the export.sh script
GEAR=flywheel/ismrm-rd-demo
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

docker build --no-cache --tag $GEAR $DIR

#!/bin/bash

set -e

export DISPLAY=:99
Xvfb ${'$'}DISPLAY &
sleep 1

/opt/builder/bin/idea.sh helpbuilderinspect -source-dir . -product $PRODUCT --runner github -output-dir artifacts/ || true
echo "echo Test existing artifacts"
test -e artifacts/$ARTIFACT && echo $ARTIFACT exists


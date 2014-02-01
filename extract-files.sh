#!/bin/bash

export DEVICE=${PWD##*/}
export BOARDCONFIGVENDOR=true

../togari/extract-files.sh $@

../common/extract-files.sh $@

../common/setup-makefiles.sh

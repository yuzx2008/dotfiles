#!/bin/bash

filePath=/home/yuzx/bin
# Time=`date | awk {'print $4'} | awk -F : {'print $1'}`
audioFile="$filePath/1.mp4"
echo $audioFile
player="cvlc --play-and-exit -q"

$player $audioFile

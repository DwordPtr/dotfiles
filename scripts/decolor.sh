#!/bin/bash
# Pipe text into me to whipe out 
# control characters
sed -E "s/[[:cntrl:]]\[[0-9]{1,3}m//g"

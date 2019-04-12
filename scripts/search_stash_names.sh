#!/bin/bash
GIT='git --no-pager'
stash_max=`$GIT stash list | tail -1 | grep -o "{\d*}" | tr -d '{}'`
for i in `seq 0 $stash_max`
do 
	echo files diff @: $i
	echo `$GIT diff --name-only stash@{$i}`
done

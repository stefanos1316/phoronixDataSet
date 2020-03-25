#!/bin/bash

if [ $1 == '-h' ]; then
	echo "\$1 -> originalNum \$2 -> newNum file, and \$3 -> taskName"
	exit
fi	

originalNum=$1
newNum=$2
taskName=$3

paste <(grep $taskName $originalNum) <(grep $taskName $newNum |  awk '{print $2}')  | awk '{sum=(($3-$2)/$2) * 100} {print $1":"sum}'

#!/bin/bash

dataType=$1

echo Tasks	Stock	Meltdown	Spectre		MDS > ${dataType}.txt
paste <(awk '{print $2}' stock_perf/${dataType}.txt) <(awk '{print $2}' meltdown_perf/${dataType}.txt) <(awk '{print $2}' spectre_perf/${dataType}.txt) <(awk '{print $2}' mds_perf/${dataType}.txt) >> ${dataType}_beforelog10.txt

while read -r line; do
	logLine=''
	for i in ${line[@]}; do
		logLine+=`echo "scale=2 ; l($i)/l(1.5)" | bc -l`
		logLine+="  "
	done
	echo $logLine >> tmp.txt
done <${dataType}_beforelog10.txt

paste <(awk '{print $1}' stock_perf/${dataType}.txt) <(cat ${dataType}_beforelog10.txt) >> ${dataType}.txt
rm tmp.txt; rm ${dataType}_beforelog10.txt

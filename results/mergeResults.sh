#!/bin/bash

dataType=$1

paste <(cat stock_perf/${dataType}.txt) <(awk '{print $2}' meltdown_perf/${dataType}.txt) <(awk '{print $2}' spectre_perf/${dataType}.txt) <(awk '{print $2}' mds_perf/${dataType}.txt) > ${dataType}.txt

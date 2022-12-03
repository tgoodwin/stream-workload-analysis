#!/bin/sh 
#PBS -l nodes=1:ppn=2 -l walltime=240:00:00
#PBS -M renau@ucsc.edu
ESESC_BIN=${1:-../main/esesc}
export ESESC_ReportFile="spec00_crafty"
export ESESC_BenchName="./bins/spec00_crafty.riscv64"
if [ -f $ESESC_BIN ]; then
  $ESESC_BIN <./data/spec00/186.crafty/crafty.in
else
  $ESESC_BenchName <./data/spec00/186.crafty/crafty.in
fi
exit 0

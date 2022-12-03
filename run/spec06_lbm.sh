#!/bin/sh 
#PBS -l nodes=1:ppn=2 -l walltime=240:00:00
#PBS -M renau@ucsc.edu
ESESC_BIN=${1:-../main/esesc}
export ESESC_ReportFile="spec06_lbm"
export ESESC_BenchName="./bins/spec06_lbm.riscv64  3000 0 0 ./data/spec06/470.lbm/100_100_130_ldc.of"
if [ -f $ESESC_BIN ]; then
  $ESESC_BIN 
else
  $ESESC_BenchName 
fi
exit 0

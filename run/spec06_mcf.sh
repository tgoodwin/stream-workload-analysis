#!/bin/sh 
#PBS -l nodes=1:ppn=2 -l walltime=240:00:00
#PBS -M renau@ucsc.edu
ESESC_BIN=${1:-../main/esesc}
export ESESC_ReportFile="spec06_mcf"
export ESESC_BenchName="./bins/spec06_mcf.riscv64 ./data/spec06/429.mcf/inp.in"
if [ -f $ESESC_BIN ]; then
  $ESESC_BIN 
else
  $ESESC_BenchName 
fi
exit 0

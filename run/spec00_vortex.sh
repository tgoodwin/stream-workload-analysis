#!/bin/sh 
#PBS -l nodes=1:ppn=2 -l walltime=240:00:00
#PBS -M renau@ucsc.edu
ESESC_BIN=${1:-../main/esesc}
export ESESC_ReportFile="spec00_voxtex"
export ESESC_BenchName="./bins/spec00_vortex.riscv64 ./data/spec00/255.vortex/lendian1.raw"
if [ -f $ESESC_BIN ]; then
  $ESESC_BIN 
else
  $ESESC_BenchName 
fi
exit 0

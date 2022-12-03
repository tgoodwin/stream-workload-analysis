#!/bin/sh 
#PBS -l nodes=1:ppn=2 -l walltime=240:00:00
#PBS -M renau@ucsc.edu
ESESC_BIN=${1:-../main/esesc}
export ESESC_ReportFile="spec00_parser"
export ESESC_BenchName="./bins/spec00_parser.riscv64 ./data/spec00/197.parser/2.1.dict"
if [ -f $ESESC_BIN ]; then
  $ESESC_BIN <./data/spec00/197.parser/ref.in
else
  $ESESC_BenchName <./data/spec00/197.parser/ref.in
fi
exit 0

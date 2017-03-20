#!/bin/bash
set -eu
RESULTDIR="test1"
# Modify paths to your programs below as needed
NOGO1="Go3/Go3.py"
NOGO2="Go4/Go4.py"
TWOGTP=gogui-twogtp 

run() {
echo Match with $NUGAMES games on board size $BOARDSIZE. Storing results in $RESULTDIR

mkdir -p $RESULTDIR
$TWOGTP -black "$NOGO1 --sim50" -white "$NOGO2--sim50"\
-auto  -komi 6.5 -size $BOARDSIZE -games $NUGAMES \
-sgffile $RESULTDIR/game -threads 1 

$TWOGTP -analyze $RESULTDIR/game.dat -force
}

NUGAMES=100
BOARDSIZE=5
run

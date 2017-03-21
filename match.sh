
#!/bin/bash
set -eu
RESULTDIR="test1"
# Modify paths to your programs below as needed
GO3="Go3/Go3.py"
GO4="Go4/Go4.py"
TWOGTP=gogui-twogtp 

run() {
echo Match with $NUGAMES games on board size $BOARDSIZE. Storing results in $RESULTDIR

mkdir -p $RESULTDIR
$TWOGTP -black "$GO3" -white "$GO4" \
-auto  -komi 6.5 -size $BOARDSIZE -games $NUGAMES \
-sgffile $RESULTDIR/game -threads 1000

$TWOGTP -analyze $RESULTDIR/game.dat -force
}

NUGAMES=100
BOARDSIZE=5
run

 #!/bin/bash

rm -rf 0

cp -r 0_org 0

#potentialFoam | tee log.potentialFoam

decomposePar

mpirun -np 4 renumberMesh -overwrite -parallel

mpirun -np 4 simpleFoam -parallel | tee log.simpleFoam 

reconstructPar -latestTime

simpleFoam -postProcess -func wallShearStress -noZero -noFunctionObjects

postProcess -func sampleDict -noZero

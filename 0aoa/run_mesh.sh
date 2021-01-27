#!/bin/bash


foamCleanTutorials

fluentMeshToFoam ../geometry_mesh/MDA3_uns.msh

#To rename and change type of the patches in the file boundary
#cp system/boundary constant/polyMesh/
changeDictionary
sed -i 's/farfield_riemann/farfield/g' constant/polyMesh/boundary
sed -i 's/wall_main/wall_airfoil/g' constant/polyMesh/boundary

rm -rf 0

cp -r 0_org 0

#Scale the geometry
transformPoints -scale '(1 1 0.00023570225967992057)'
transformPoints -scale '(0.001 0.001 0.5)'

checkMesh

checkMesh | tee log.checkMesh

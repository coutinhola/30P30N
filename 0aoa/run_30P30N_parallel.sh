#!/bin/bash
#
# Script de exemplo para submeter trabalho que não use MPI 
#
#SBATCH --job-name=30P30N               # Nome do trabalho a ser executado (para melhor identificação)
#SBATCH --partition=cpu_open                   # Em qual fila o trabalho será executado (ver filas disponíveis com o comando sinfo)
#SBATCH --tasks-per-node=5
#SBATCH --nodes=1                          # Número de nós (computadores) que serão utilizados (1 para códigos openMP)
#SBATCH --time=00:00:00                    # Tempo máximo de simulação (D-HH:MM). O tempo 00:00:00 corresponde a sem limite.
#SBATCH -o slurm.%N.%j.out                 # Nome do arquivo onde a saída (stdout) será gravada %N = Máquina , %j = Número do trabalho. 
#SBATCH -e slurm.%N.%j.err                    # Nome do arquivo para qual a saída de erros  (stderr) será redirecionada.
#SBATCH --mail-type=BEGIN                  # Envia email quando o trabalho for iniciado
#SBATCH --mail-type=END                    # Envia email quando o trabalho finalizar
#SBATCH --mail-type=FAIL                   # Envia email caso o trabalho apresentar uma mensagem de erro.

source ~/scripts/RunFunctions

foamCleanTutorials
runApplication fluentMeshToFoam ../geometry_mesh/MDA3_uns.msh
runApplication changeDictionary
sed -i 's/farfield_riemann/farfield/g' constant/polyMesh/boundary
sed -i 's/wall_main/wall_airfoil/g' constant/polyMesh/boundary
rm -rf 0
cp -r 0_org 0 
transformPoints -scale '(1 1 0.00023570225967992057)'
transformPoints -scale '(0.001 0.001 0.5)'
runApplication checkMesh

runApplication decomposePar
runParallel renumberMesh -overwrite
runParallel $(getApplication) 
runApplication reconstructPar -latestTime
#runApplication $(getApplication) -postProcess -func wallShearStress -noZero -noFunctionObjects
#runApplication -postProcess -func sampleDict -noZero






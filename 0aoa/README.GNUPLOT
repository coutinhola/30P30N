#How to run me:

reset
set xlabel 'iter'
set ylabel 'cd'
plot [10:][] 'postProcessing/forceCoeffs_object/0/forceCoeffs.dat' u 1:3 w l title 'cd'

reset
set xlabel 'iter'
set ylabel 'cl'
plot [10:][] 'postProcessing/forceCoeffs_object/0/forceCoeffs.dat' u 1:4 w l title 'cl'


#Compute statistics
stats 'postProcessing/forceCoeffs_object/0/forceCoeffs.dat' u 4 every ::500::-1
stats 'postProcessing/forceCoeffs_object/0/forceCoeffs.dat' u 1:4 every ::500::-1


every I:J:K:L:M:N

I line increment
J data block increment
K the first line
L the first data block
M the last line
N the last block

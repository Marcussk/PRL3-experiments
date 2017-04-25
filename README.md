# PRL3-experiments
Experiments tools for PRL course @BUT project 3  
  
See Makefile for usage  
runs experiment script against mm for given number of iterations and outputs results into .csv  
.csv is then parsed into columns for easy calculation of average time needed  

Note:  
Output of mm application needs to be updated to this format:  
n;m;t  
where:  
n - number of processors  
m - number of inputs  
for mat1 of size x,y  
    mat2 of size y,z   
resulting multiplied matrix is of size x,z  
 and m is y  
t - total time running (calculated using MPI_Wtime())  

 

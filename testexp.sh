#!/usr/bin/env bash

# Author: Zuzana Studená xstude22@stud.fit.vutbr.cz
# Edits: Marek Beňo xbenom01@stud.fit.vutbr.cz
# Experiments script for PRL - 3 Project
# takes generated matrices in matrices folder

if [ $# -lt 1 ];then
	runs=5;
else
	runs=$1;
fi;

experimentIndexStart=1
experimentIndexEnd=35

mpic++ --prefix /usr/local/share/OpenMPI -o mm mm.cpp -std=c++0x

(>&2 echo "Starting experiments...")
(>&2 echo "***********************************************")

mpic++ -o mm mm.cpp -std=c++0x

# Matrices to test
for (( i=$experimentIndexStart; i<=$experimentIndexEnd; i++ ))
do
	mat1=$(head -n1 matrices/mat1_$i)
	mat2=$(head -n1 matrices/mat2_$i)

	cp matrices/mat1_$i ./mat1
	cp matrices/mat2_$i ./mat2

	cpus=$((mat1*mat2))

	# Number of runs
	for (( j=1; j<=$runs; j++ ))
	do

		mpirun -np $cpus mm

		(>&2 echo -e "Test $i iteration $j for $cpus processors FINISHED.")

	done
done

(>&2 echo "***********************************************")
(>&2echo -e "Experiments FINISHED.")

rm -f mm

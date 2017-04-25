# parse PRL3  project experiment results into more Excel friendly state
# Author: Marek Beno, xbenom01@stud.fit.vutbr.cz
# Author: Zuzana Studena, xstude22@stud.fit.vutbr.cz
# input: arg1 - filename for input file from experiments
#		 arg2 - number of iterations used in experiments

import csv
import collections
import sys

fname = str(sys.argv[1])
iterations = int(sys.argv[2])
d = collections.OrderedDict()
with open(fname, 'rb') as csvfile:
	fileReader = csv.reader(csvfile, delimiter=';', quotechar='|')
	for x, y, z in fileReader:
		if x not in d:
			d[x] = []
		d[x].append(z)
for k,v in d.items():
	sys.stdout.write(k)
	sys.stdout.write(';')
sys.stdout.write('\n')
for i in range(iterations):
	for k,v in d.items():
		sys.stdout.write(v[i])
		sys.stdout.write(';')
	sys.stdout.write('\n')
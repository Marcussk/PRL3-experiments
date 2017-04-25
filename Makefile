# experiment PRL 3 project
# Author: Marek Beňo, xbenom01@stud.fit.vutbr.cz
# Author: Marek Beňo, xbenom01@stud.fit.vutbr.cz

iterations=20

test:
	./testexp.sh $(iterations) > experimentsResults.csv
	python parseResults.py experimentsResults.csv $(iterations) > parsedResults.csv

clean:
	rm -f experimentsResults.csv parsedResults.csv

pdf:
	typst compile main.typ --font-path ./fonts

python:
	python ./src/regression.py
	python ./src/generate_plot.py

dot:
	dot -Tsvg ./diagram/diag_shannon.dot -o ./img/diag_shannon.svg
	dot -Tsvg ./diagram/diag_shannon2.dot -o ./img/diag_shannon2.svg
	dot -Tsvg ./diagram/modele.dot -o ./img/modele.svg

md:
	mmdc -i ./diagram/ia.mmd -o ./img/ia.svg

part:
	midi2ly ./data/satie.mid -o ./data/satie.ly
	lilypond --png -o ./img/satie ./data/satie.ly
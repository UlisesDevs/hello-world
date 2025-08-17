.PHONY: run test lint

run:
	python main.py

test:
	pytest -q

lint:
	black --check .
	flake8

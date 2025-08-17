.PHONY: run test lint lint-fix

run:
	python main.py

test:
	pytest -q

lint:
	black --check .
	flake8

lint-fix:
	black .
	flake8
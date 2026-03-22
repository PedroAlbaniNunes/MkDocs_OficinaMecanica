.PHONY: install serve build deploy clean run

VENV = .venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip
MKDOCS = $(VENV)/bin/mkdocs

## Cria o ambiente virtual .venv e instala as dependências
install: $(VENV)/bin/activate

$(VENV)/bin/activate: requirements.txt
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

## Inicia servidor local com hot-reload em http://localhost:8000
serve: install
	$(MKDOCS) serve

## Gera o site estático na pasta site/
build: install
	$(MKDOCS) build

## Publica o site no GitHub Pages
deploy: install
	$(MKDOCS) gh-deploy

## Remove o ambiente virtual e a pasta site/
clean:
	rm -rf $(VENV) site/

## Instala e já sobe o servidor
run: install serve
# Hola

Esta es una prueba ejecutando entornos virtuales, makefile, gitignore, pre-commit, black, flake8 y pytest

## Crear e inicializar el entorno virtual.
De esta manera crearemos nuestro entorno virtual y lo inicializaremos, recuerda que esto se hace dentro de la carpeta raiz de tu proyecto.

    python -m venv .venv
    source .venv/bin/activate

## Creamos nuestro .gitignore
Procedemos a crear nuestro .gitignore con el siguiente contenido.

    # Byte-compiled / cache
     __pycache__/
    *.py[cod]
    *.pyo
    # Virtual env
    .venv/
    env/
    # Editor
    .vscode/
    # Distribution / packaging
    dist/
    build/
    *.egg-info/

## Pre-commit, black y flake8.
Pre-commit es una herramienta que nos permite ejecutar scripts automaticamente antes de ejecutar un commit, esto es de ayuda para evitar subir codigo que no cumple
con ciertos estandares o que tenga errores evidentes.

Black es un formateador de codigo automatico para Python.

Flake8 es un linter para Python que nos ayuda a encontrar errores, problemas de estilo o malas practicas.

Procedemos a instalarlos dentro de nuestro entorno virtual, junto con pytest.

    pip install black flake8 pytest pre-commit

Creamos nuestro archivo .yaml este archivo debe estar en la raiz de nuestro repositorio/proyecto,  es donde escribiremos 
la configuracion de pre-commit, debe llamarse de la siguietne manera.

    .pre-commit-config.yaml

dentro del este archivo escribimos lo siguiente.

    repos:
    - repo: https://github.com/psf/black
      rev: 23.12.1
      hooks:
        - id: black
          language_version: python3.12
    - repo: https://github.com/pycqa/flake8
      rev: 6.1.0
      hooks:
        - id: flake8
          language_version: python3.12
          
Ahora cada vez que ejecutemos un git commit correra black + flake8 antes, recuerda que al ejecutarlo modificara los archivos por lo tanto habra que ejecutar nuevamente git add . y posteriormente 
de nuevo el git commit -m "Auto correccion ejecutada con black y flake8"

Tambien es conveniente poner la version que estamos utilizando de Python para evitar errores de compatibilidad.

Ahora que creamos nuestro archivo .yaml y lo configuramos hay que ejecutar el siguiente comando para asegurarnos que todos los hooks se apliquen a todos los archivos existentes y no solo a los nuevos commits.

    pre-commit install
    pre-commit run --all-files


## Makefile basico para automatizar tareas
Este archivo es un script para ejecutar tareas que son repetitivas, como correr black y flake8, o tambien pytest asi mismo ejecutar nuestro archivo main, creamos el archivo makefile asi tal cual
sin extensiones y dentro de el escribimos lo siguiente.

    
    .PHONY: run test lint lint-fix
    
    # Ejecutar el archivo principal
    run:
    	python main.py
    
    # Ejecutar pruebas con pytest
    test:
    	pytest -q
    
    # Revisar código con Black y Flake8 (sin modificar nada)
    lint:
    	black --check .
    	flake8
    
    # Revisar y corregir automáticamente el código con Black, luego pasar Flake8
    lint-fix:
    	black .
    	flake8


Ahora cada vez que queramos ejecutar una accion, en la terminal podemos ejecutar los comando make run, make test,  make lint o make lint-fix, dependiendo lo que queramos hacer.

## Archivo main.
Ahora para finalizar creamos el archivo main.py y dentro de el escribiremos el siguiente codigo.

    def saludo(nombre: str) -> str:
        return f"Hola, {nombre}!"
    
    if __name__ == "__main__":
        nombre = input("¿Cómo te llamas? ")
        print(saludo(nombre))

Una vez creado procedemos a ejecutar nuestros comandos del archivo make para formatear, correr o testear, y al final seguimos nuestro ciclo normal de git.

Con todo esto tendremos la base para crear proyectos con buenas practicas y bien estructurados dentro de un entorno virtual.

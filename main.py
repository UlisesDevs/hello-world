# main.py
def saludo(nombre: str) -> str:
    return f"Hola, {nombre}!"


if __name__ == "__main__":
    nombre = input("¿Cómo te llamas? ")
    print(saludo(nombre))

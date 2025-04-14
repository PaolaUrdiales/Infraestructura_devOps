import os
import subprocess

 

def run(cmd):
<<<<<<< HEAD
=======

>>>>>>> 3795fada46dd5f065ad0ab9b16e6d4e03c7bccee
    print(f"Ejecutando: {cmd}")
    subprocess.run(cmd, shell=True, check=True)

 

def instalar_apache():
<<<<<<< HEAD
    # Detectar distro para usar el gestor correcto
=======

    # Detectar distro para usar el gestor correcto

>>>>>>> 3795fada46dd5f065ad0ab9b16e6d4e03c7bccee
    if os.path.exists("/etc/debian_version"):
        run("sudo apt update")
        run("sudo apt install -y apache2")
        run("sudo systemctl start apache2")
        run("sudo systemctl enable apache2")

    elif os.path.exists("/etc/redhat-release"):
        run("sudo yum install -y httpd")
        run("sudo systemctl start httpd")
        run("sudo systemctl enable httpd")

    else:
        print("Distro no soportada")

 

def crear_pagina():
    html = """
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>DevOps</title>
    </head>
    <body>
        <h1>¡Hola desde el script Python de DevOps!</h1>
    </body>
    </html>
    """
<<<<<<< HEAD
=======

>>>>>>> 3795fada46dd5f065ad0ab9b16e6d4e03c7bccee
    with open("/tmp/index.html", "w", encoding="utf-8") as f:
        f.write(html)
    run("sudo mv /tmp/index.html /var/www/html/index.html")

if __name__ == "__main__":
    instalar_apache()
    crear_pagina()
#Actividad 3_DevOps
#Por Paola Urdiales

- Creación automatizada de infraestructura con Terraform
- Automatización de configuracion de instancias por medio de python
- Uso de git para el control de versiones

Estructura general:
- VPC: 10.10.0.0/20
- Subred pública: 10.10.0.0/24
- 1 servidor Jump (bastión SSH)
- 3 servidores web Linux conectados vía SSH
- Acceso HTTP desde internet (puerto 80)
- Acceso SSH al Jump Server únicamente (puerto 22)

Ramas Creadas:
- Rama Dev: En la que se desarrollo todo el archivo main.tf y el archivo setup_webserver.py
- Rama Qa: En la que se ejecutó el main.tf desde Cloud9, solo en esta rama se hizo terraform apply
- Rama Main (la principal): En donde se alojan todos los archivos funcionando correctamente

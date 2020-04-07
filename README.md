# jenkins
CI/CD

Configuración de un servidor de automatización para integración continua y despliegue continuo.

Configuration server automatization for continuous integration and continuous deploy

Requisitos Básicos:

- Docker
- Docker-compose

Para este laboratorio se estará trabajando con los siguientes contenedores:

1.- Jenkins con librerias de docker, ssh instaladas y ansible instaladas.
2.- Gitlab o bitBucket (Se realizan ejemplos con ambos).
3.- Servidor de despliegue.
4.- Servidor para almacenar Imagenes de Docker


Anfitrión es el ordenador en el cual instalamos nuestro programa docker que se encargará automatizar el despliegue de aplicaciones dentro de contenedores de software,y prestará determinados recursos de hardware al conteneder que creemos.
Invitado es el ordenador virtual que hemos creado, mediante nuestro programa de docker y al cual hemos asignado determinados recursos para funcionar.


Primer paso:

1.-Creación de contenedor de Gitlab

En este contenedor mantendremos el control de cambios de nuestros proyectos.

2.-Creación de Dokerfile para el contenedor que almacenará nuestras imagenes.

Vamos a configurar nuestro contenedor que almacenará las imagenes. Generalmente antes de realizar el deploy de nuestras aplicaciones es importante poseer un producto terminado, que haya pasado por todos los estados de validación definidos en el Pipeline-Jenkinsfile.




3.-Creación de Dockerfile para los contenedores de aplicaciones, las cuales pasaran por el ciclo de validaciones definido en el Pipeline.

Java

Node

Angular

4.-Creacion de Dockerfile para el contenedor de SonarQube

SonarQube: Es una plataforma desarrollada en Java que nos permite realizar análisis de código con diferentes herramientas de forma automatizada.

5.- Creacion Dockerfile para contenedor de jenkins

Para éste realizaremos varios ajustes:

-Automatizaremos la descarga y actualización de Jenkins, ya que la imagen por defecto de docker hub nos trae una versión antigua.
-Instalación de Ansible.
-Configuración de directorio para enlace con anfitrion que permita la gestion de docker desde el contenedor.
-Configuracion de jobs.
-Configuración de disparadores.
-Agregar llaves de seguridad.
-Autogeneración de jobs.
-Configuración de Pipeline y llamada desde gitlab

Definición de Pipeline-Jenkinsfile
  -Creación de imagen que tendra la aplicación
    -Subir la imagen al contenedor de Imagenes.
  -Ejecutación Test desde maven
  -Ejecución SonarQube
  -Deploy


Ansible es un software para configurar y administrar ordenadores, la gestión de configuraciones y el despliegue de aplicaciones. Está categorizado como una herramienta de orquestación , muy útil para los administradores de sistema y DevOps.

En otras palabras, Ansible permite a los DevOps gestionar sus servidores, configuraciones y aplicaciones de forma sencilla, robusta y paralela.

Ansible gestiona sus diferentes nodos a través de SSH y únicamente requiere Python en el servidor remoto en el que se vaya a ejecutar para poder utilizarlo. Usa YAML para describir acciones a realizar y las configuraciones que se deben propagar a los diferentes nodos.(https://openwebinars.net/blog/que-es-ansible/)

6.- Configuración de disparadores de eventos

Gitlab -> jenkins

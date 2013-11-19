---
authors: ['Kennynnek']
date: 2013-05-21 02:03:18+00:00
layout: post
slug: debian-7-como-lograr-usar-tarjeta-wifi
title: 'Debian 7, cómo lograr usar tu tarjeta Wi-Fi.'
thumbnail: ['/attachments/2013/05/debian.png', 'Logo de Debian']
categories: ['debian', 'linux', 'tutoriales']
tags: ['wifi', 'configuración']
---

La semana siguiente a la salida de Debian Wheezy, lo instalé con Gnome 3.4 como interfaz de escritorio. Tuve que hacer algunas cosas para que mi sistema funcionase correctamente y deseo compartirlas con ustedes. Anteriormente, con Ubuntu, tuve que realizar diversas tareas desde la terminal y muchas veces ignoraba qué estaba haciendo. Por ello, he decidido hacer este artículo. Obviamente existe una infinidad de comandos en Linux y otro gran montón de paquetes y programas que podemos instalar. **Así que este artículo está dirigido a principiantes que hacen cosas básicas y desean entender lo que están haciendo.**

Después de hacer una instalación limpia desde un usb (no es necesario explicar este proceso, ya que hay diversas guías para ello), me di cuenta que la tarjeta wifi no funcionaba. Un ejemplo bastante común. Investigando por la red, hallé un artículo en la [Wiki oficial de Debian ](http://wiki.debian.org/WiFi)en donde se especificaban los paquetes necesarios para usar determinadas tarjetas de red inalámbricas. Solo era necesario buscar esos paquetes. Ahora bien, ¿qué hacer en caso de no saber cual tarjeta Wi-Fi tengo? Muy fácil, usaremos lspci. Abrimos una terminal (en mi caso al presionar Alt+F2 puedo escribir gnome-terminal y se abrirá, o pueden buscarla dentro de las aplicaciones) y escribimos
    
    $ lspci | grep -w Wireless

**lspci** no tiene un significado literal, pero podría ser List Peripheral Component Interconnect. La interconexión de componentes periféricos es:

> "un bus de ordenador estándar para conectar dispositivos periféricos directamente a tu placa base."

Vale que esto no es un blog de electrónica, pero ¿alguna vez han visto las ranuras de plástico blancas o grises en su placa base? Bueno, pues a eso se refiere. Asi que **con lspci tenemos una lista** de todos esos componentes conectados a nuestra placa.
**grep** es una instrucción para **filtrar** la respuestas de los comandos. El objetivo aquí es solo explicar las instrucciones usadas, así que no ahondaremos. Hay muchas formas de utilizar grep, pero al escribir -w hacemos referencia a que la búsqueda coincida con una palabra, la cual escribimos a continuación  en nuestro caso Wireless, porque necesitamos activar nuestra tarjeta de red inalámbrica. Dependiendo de nuestra tarjeta específica nos devolverá algo así
   
    01:00.0 Network controller: Intel Corporation Centrino Wireless-N 1030 [Rainbow Peak] (rev 34)

(Para más información de **grep** (un comando bastante útil) revisen esta entrada de UnivUnix [Comandos terminal (4): “grepeando](http://www.univunix.com/linux/comandos-terminal-4-grepeando/) por Ferthedems)

De esta manera, en la wiki que antes mencionaba, procedemos a buscar el paquete que debemos instalar. En mi caso es **iwlwifi**, así que procedo a instalarlo. En la wiki están las instrucciones de como instalarlo, aún así, explicaremos que significan. Primero necesitaremos agregar unas líneas en un archivo que se llama sources.list y debemos saber que /etc/apt es su carpeta de ubicación. Las líneas son las siguientes:
    
    # Debian 7.0 "Wheezy"
    deb http://http.debian.net/debian/ wheezy main contrib non-free

Eso significa que tendremos que hacer varias cosas y las explicaremos lo más simple y completo posible para que puedas saber que estas haciendo con tu sistema exactamente. Las instrucciones en la terminal serian las siguientes
    
    $ su
    # cd /etc/apt
    # nano sources.list

Escribir las dos lineas que hemos descrito anteriormente, guardar el documento (Ctrl+O) y salir del editor (Ctrl+C).
    
    # exit

Ahora vamos a explicar el código. **su** es una instrucción para obtener permisos de administrador en el sistema.Significa "super user". Al usar esta instrucción deberán escribir la contraseña de superusuario que establecieron en la instalación.

**cd** significa "current directory" y nos ayuda a movernos por los directorios o carpetas en la terminal. Al escribir **cd** seguido de un "camino", llegaremos a ese camino o a esa carpeta que hemos definido, en nuestro caso una carpeta llamada apt.

**etc** es una carpeta que contiene varios archivos de configuración de nuestro sistema y **apt** es el directorio de los archivos de configuración de APT. **APT** (Advanced Packaging Tool) (Herramienta Avanzada de Empaquetado) es una herramienta creada por el proyecto Debian, que pone a disposición funciones de una libreria de C++ para que otras aplicaciones puedan instalar paquetes más fácilmente, especialmente apt-get.

**Nano** es un editor de textos de consola muy versátil y que en lo personal me gusta mucho, más que VI. Al escribir nano seguido de un archivo de texto plano, el editor abre el archivo para que podamos editarlo en la terminal. Ahora bien, **sources.list** es un archivo que contiene una lista de las fuentes de donde apt-get puede descargar, actualizar e instalar paquetes o "programas" si queremos verlo así  Es una archivo muy importante.

Como comentario **importante** debo decir que al estar dentro del archivo sources.list deben borrar toda referencia a los discos de instalación de Debian, si en caso aparecen.

En mi caso, para mi tarjeta de red especifica, lo único que faltará será
    
    # apt-get update
    # apt-get install firmware-iwlwifi
    # modprobe -r iwlwifi
    # modprobe iwlwifi

Como mencionábamos antes, **apt-get** se encargara de actualizar su lista de paquetes disponibles y de instalar el paquete requerido. Es importante mencionar que para estas primeras dos

**modprobe** es un programa que se usa para agregar módulos cargables de núcleo en el kernel (valga la redundancia). En palabras super simples, un módulo cargable de núcleo es una extensión del núcleo que se usan para incluir la información de nuevo hardware. En mi caso, el modulo iwlwifi esta precargado en el sistema, así que debo sustituirlo. De allí la instrucción **modprobe -r**, elimina ese módulo, y la siguiente instrucción lo vuelve a cargar con el firmware ya actualizado. (recuerden que lo hemos bajado de los repositorios de Debian).

Al final de este proceso realmente muy corto, lo único que hay que hacer es administrar las redes a las que tengamos alcance con nuestra tarjeta de red inalámbrica, ya sea en nuestra casa o en algún otro lugar. Dependiendo del entorno de escritorio este proceso será diferente, pero es algo muchísimo mas intuitivo y de seguro no se perderán.
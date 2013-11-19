---
author: Aglezabad
comments: true
date: 2013-04-26 19:45:18+00:00
layout: post
ignored: true
slug: lo-mejor-de-cada-entorno-lxde-con-aplicaciones-gnome
title: 'Lo mejor de cada entorno: LXDE con aplicaciones GNOME'
wordpress_id: 240
categories:
- Linux
- Tutoriales
following_users:
- Aglezabad
tags:
- Entornos de escritorio
- Gnome
- LXDE
---

Un servidor, desde que empecé a usar Debian, iba con un objetivo fijo, GNOME 3. Me manejé bien con ese entorno y me terminó gustando para usarlo día a día, pero hay un par de cosas que no me gustan del mismo. El primer problema que veo es la inclusión como software obligatorio de varias aplicaciones que nunca o casi nunca daré uso. Este es el caso de "Cheese", una aplicación para realizar fotografías con una webcam.

Otro problema que veo es el consumo de recursos que realiza Gnome-Shell, ya que realiza operaciones gráficas con la GPU. Esto supone una pequeña pérdida de rendimiento en aplicaciones OpenGL, que se hace notable en los modelos de tarjetas gráficas de gama media-baja.

Para solucionar este problema, opté por cambiar de escritorio. Podía usar KDE, pero nunca le he visto interés (soy más de Gnome); o usar MATE, el fork basado en Gnome 2 y volver a un entorno conocido. Pero encontré un entorno ligero y atractivo, al menos para mi: LXDE. Lo bueno de LXDE es su bajo consumo de recursos, mediante el uso de aplicaciones con bajo consumo de memoria y tener a openbox como gestor de ventanas.

Pero todo entorno tiene sus pros y sus contras, y en el caso de LXDE es la extrema sencillez de sus aplicaciones, a las que no he podido coger gusto, a diferencia de algunas aplicaciones disponibles con Gnome 3, como son Rhythmbox o Nautilus. Entonces, ¿por qué no tener lo mejor de ambas?, una especie de entorno Gnome usando LXDE como base, ya que este entorno usa GTK. Os explicaré cómo hacerlo y el resultado que otorga.

Lo primero de todo es instalar LXDE, que es muy sencillo de realizar en Debian. Primero nos convertimos en root:

    
    $ su


Y con aptitude o apt-get, instalamos el entorno.

    
    # aptitude install lxde


Muy sencillo todo.


### Reemplazar PcManFM por Nautilus


[alert text="**Atención: **Puede parecer una herejía cambiar componentes de LXDE, pero es una preferencia personal."]



Ahora, la parte que tocaría realizar es la sustitución de PCManFM por Nautilus como programa gestor de ficheros y de escritorio, ya que mi preferencia ha sido este programa. Va a haber bastantes modificaciones, ya que con la ausencia del paquete _gnome-control-center (GNOME 3)_ será complicado modificar la configuración de los fondos de pantalla entre otros ejemplos. Aparte, LXDE depende de PCManFM para su funcionamiento, así que debemos conservarlo a pesar de no usarlo. No hay que preocuparse por esa situación, ya que el susodicho programa consume poco espacio en disco.



Los pasos que deberíamos seguir para cumplir con esta sección es, obviemente, instalar nautilus mediante los comando apt-get o aptitude, el que más nos guste.

    
    # apt-get install nautilus



    
    # aptitude install nautilus


Lo siguiente a realizar es la asignación por defecto de Nautilus, el cual se puede realizar de forma muy sencilla, gracias a[ una respuesta en AskUbuntu](http://askubuntu.com/questions/155897/how-to-make-nautilus-the-default-file-manager-in-lxde). En primer lugar, cambiamos la entrada "Gestor de archivos" o "File manager" la siguiente sentencia de ejecución:

    
    pcmanfm %U


por

    
    nautilus %U


Con esto conseguimos ejecutar nautilus sin tener que realizar muchos cambios, pero tenemos otra cosa que hacer. PCManFM, al igual que Nautilus, tiene capacidad de soportar y manejar el entorno de escritorio (y todo lo que conlleva este), por lo que debemos sustituir el manejador de escritorio, cambiando una sentencia en el fichero:

    
    /etc/xdg/lxsession/LXDE/autostart


El cambio es la sustitución de esta sentencia:

    
    <code>@pcmanfm --desktop --profile LXDE </code>


por esta otra:

    
    @/usr/bin/nautilus -n


Con esto, Nautilus será quien maneje el entorno de escritorio y así evitamos tener en ejecución dos programas y entren en posibles conflictos. Pero el problema que tenemos ahora es el no poder cambiar el fondo de escritorio de una forma sencilla, ya que debemos recurrir a utilizar el programa _dconf-editor _y cambiar a mano las opciones de escritorio en _org-gnome-desktop-background_. Espero encontrar alguna forma de poder realizar esta función sin tanta complicación y sin tener que añadir más paquetes de gnome.

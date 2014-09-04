---
authors: ['Aglezabad']
date: 2014-08-24 22:30:00+00:00
layout: post
title: Compilar e instalar Firefox OS 2.0 en el ZTE Open
thumbnail: ['/attachments/2014/08/firefoxos.png','La imagen de Firefox OS']
categories: ['linux', 'firefoxos']
tags: ['instalación', 'compilación', 'zte open']
---

<div class="alert alert-warning">
	**AVISO:** El seguimiento de esta guía anula la garantía que pueda tener el dispositivo. También el no seguir correctamente los pasos puede provocar el bloqueo total del mismo.
</div>

El desarrollo de este nuevo sistema operativo para dispositivos móviles por parte de Mozilla y con la base del kernel Linux ha alcanzado un nuevo nivel con la versión 2.0. Dicha versión posee multitud de mejoras a nivel de rendimiento y un cambio drástico de interfaz. Y como es normal en mi persona, tenía tantas ganas de probar la nueva versión en mi ZTE Open.

Aunque muchos pueden pensar que, en un teléfono de gama entrante como este, sea imposible meter versiones más avanzadas por la consiguiente falta de rendimiento, quiero decirles que, de momento y a día de publicar este artículo, no he tenido problema alguno en ese aspecto. Eso sí, al no ser estable, puede fallar algunas funciones que listaremos a continuación.

##Funciones probadas.

A continuación pueden ver dos listas con las funciones que fueron probadas en el ZTE Open. Como es normal, puede que haya pasado por alto unas cuantas.

###Elementos que funcionan.

* Wifi
* GSM y WCDMA (Red Movistar España, usando el *bypass* en rilproxy. Esto quiere decir que funcionan tanto el servicio de voz como el de datos.)
* SMS
* Hotspot
* Cámara (Fotos y vídeos)
* GPS
* Sensor de iluminación de pantalla
* Reproductor de música

###Elementos que NO funcionan (de momento).

* Radio FM (No funciona el sonido a través de los audífonos, solamente desde el altavoz)
* El botón **"home"** no se ilumina. (Hay un posible parche a esto, pero no está aplicado en la 2.0)
* Reproductor de vídeo (Posibles cuelgues, fallos críticos durante la reproducción.)

##El sujeto de prueba.

<div class="alert alert-info">
	**OJO:** No confundir el ZTE Open (primer modelo) con el Open C. Aunque se parezcan, **son completamente diferentes**. El Open original usa como base AOSP (Android Open Source Project) Ice Cream Sandwich (dispositivo inari) mientras que el Open C utiliza AOSP Jellybean (dispositivo flame).
</div>

<img class="img-responsive img-rounded lazy center-block" data-original="/attachments/2014/08/ZTE-Open.jpg" src="/img/placeholder.gif" alt="El ZTE Open, el primer modelo puramente comercial con Firefox OS.">

Nuestro sujeto y objetivo de esta guía es el ZTE Open, el primer modelo comercial, a diferencia de los modelos traídos por la marca Geeksphone, los cuales estaban orientados al desarrollo. Este teléfono estuvo disponible libre (sin simlock) desde eBay mientras que en España y Latinoamérica lo estuvo a través de la compañía Movistar (con simlock al principio, ahora libre con los cambios en la política de empresa). Las diferencias entre comprarlo a Movistar y libre son dos: la primera es el color de dispositivo (azul para Movistar, naranja si lo compró en eBay)) y la segunda es el software. Movistar, junto con ZTE, realizan una compilación exclusiva para esta compañía, incluyendo software vario y el idioma español.

Tras indicar las diferencias entre uno y otro, cabe mencionar que la diferencia entre un proveedor u otro puede hacer variar los pasos a realizar en nuestro dispositivo para lograr esta versión. Lo indicaré en cada paso.

Ahora sí, tras mencionar a nuestro sujeto, procedemos a dar los pasos correspondientes.

##Preparativos previos.

Antes de proceder con la preparación del dispositivo, vamos a realizar los requisitos previos para realizar todos los pasos. Para evitar dar la información por duplicado, basta con seguir las instrucciones de Mozilla en referencia a los requisitos. Os indico las instrucciones en Inglés, las cuales están más actualizadas pero también incluiré las mismas en español, por si tienen complicaciones con el idioma.

* [Requisitos para la compilación de Boot2Gecko (Firefox OS) (Inglés)](https://developer.mozilla.org/en-US/Firefox_OS/Firefox_OS_build_prerequisites)
* [Requisitos para la compilación de Boot2Gecko (Firefox OS) (Español)](https://developer.mozilla.org/es/docs/Mozilla/Boot_to_Gecko/Firefox_OS_build_prerequisites)

##Preparación del dispositivo.

Lo primero antes de comenzar es comprobar la versión de Firefox OS que tenemos instalada. Supongo que será la versión 1.0. Si no es así, consulta previamente en los comentarios por si ha habido cambios.

<div class="alert alert-warning">
	Al parecer, **en la versión 1.1 no se puede obtener root**, pero sí es posible aplicar fastboot **(solo en modelos eBay)**. Voy a intentar investigar y, si con suerte y dinero, obtener otro ZTE Open con Movistar e intentar la guía desde FFOS 1.1
</div> 

###Obtener root e instalar ClockworkMod recovery.

Después, procedemos a aplicar root, cosa común en los teléfonos Android y también en Firefox OS, ya que el mismo está construido sobre AOSP, eliminando la máquina Dalvik entre otros elementos.

Para la aplicación de root y del recovery pueden leer [este artículo de Pau Oliva](http://pof.eslack.org/2013/07/05/zte-open-firefoxos-phone-root-and-first-impressions/) (en inglés). En él explica la vulnerabilidad concreta para lograr obtener root e incluso dispone de un ejecutable (variante del exploit de Hiroyuki Ikezoe) junto con el código fuente. Son tres ficheros (un sh, un batch y el que realiza la obtención de root). Basta con ejecutar el sh o el bat (según GNU/Linux, Mac o Windows) y lo tendremos listo. Si no funciona a la primera, seguid intentándolo reiniciando previamente el teléfono (solo en Windows, en Linux y Mac lo hace de forma automática).

<div class="alert alert-info">
	Recuerde **activar el depurador remoto** en las opciones de desarrollador. Puedes hacerlo siguiendo esta ruta: Opciones -> Información del dispositivo -> Más información -> Desarrollador.
</div>

Una vez obtenido los privilegios, hacemos backup del recovery:

	$ adb shell
	android$ su
	android# busybox dd if=/dev/mtd/mtd0 of=/sdcard/stock-recovery.img bs=4k

e instalamos ClockworkMod:

	android# adb push recovery-clockwork-6.0.3.3-roamer2.img /sdcard/cwm.img
	android# adb shell flash_image recovery /sdcard/cwm.img

###Rooteo profundo del ZTE Open.

Así lo llama Eduardo González en el artículo que realizó sobre [cómo actualizar a Firefox OS 1.1](http://sl.edujose.org/2013/09/zte-open-hack-actualizando-fxos-11.html). Según él, este paso es necesario para poder acceder a todo el contenido del dispositivo.

Para ello, una vez logrado el paso anterior entramos en el teléfono con adb y copiamos la partición boot:

	$ adb shell
	android$ su
	android# cat /dev/mtd/mtd1 > /sdcard/boot.img
	android# exit
	android$ exit
	$ adb pull /sdcard/boot.img /home/"user"/boot.img

Después, procedemos a la instalación de la herramienta abootimg, disponible en los repositorios de Debian y Ubuntu o en [la web del proyecto](https://gitorious.org/ac100/abootimg/source/7e127fee6a3981f6b0a50ce9910267cd501e09d4:). Si se descargan el código fuente, basta con hacer:

	$ make
	$ sudo make install

Tras haber instalado la herramienta, extraemos el contenido de boot.img:

	$ abootimg -x /home/"user"/boot.img

En la carpeta resultante, creamos un directorio, de nombre a_dir y extraemos la imagen de init:

	$ mkdir "ruta a boot.img expandido"/a_dir; cd "ruta a boot.img expandido"/a_dir
	$ gunzip -c ../initrd.img | cpio -

Modificar el fichero default.prop con el siguiente contenido

###Obtener fastboot (solo modelos Movistar).

Una vez conseguida la obtención de root y la instalación de un recovery alternativo al original de Mozilla, procederemos a actualizar

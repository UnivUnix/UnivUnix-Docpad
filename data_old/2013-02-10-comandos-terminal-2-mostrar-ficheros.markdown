---
author: Ferthedems
comments: true
date: 2013-02-10 12:34:51+00:00
layout: post
slug: comandos-terminal-2-mostrar-ficheros
title: 'Comandos terminal (2): mostrar ficheros'
wordpress_id: 130
categories:
- Linux
- Tutoriales
following_users:
- Ferthedems
tags:
- Bash
- Comandos
- Linux
- Terminal
- Tutoriales
---

![text file icon](http://www.univunix.com/wp-content/uploads/text_file_92771-150x150.jpg)Esta publicación es la continuación de la anterior:[ entrada y salida estándar](http://www.univunix.com/tutoriales/comandos-terminal-1-entrada-y-salida-estandar/).

Aquí veremos como ver el contenido de un fichero en la terminal _(usando la salida estándar)_.

Como debido a razones de fuerza mayor fui muy teórico en la anterior publicación, por lo que **voy a aligerar esta lo máximo posible**.

_Veamos los comandos más utilizados para el propósito de la entrada:_



	
  * **cat**: muestra el contenido completo de un fichero.

	
  * **head**: muestra las diez primeras líneas de un fichero.

	
  * **tail**: muestra las diez últimas líneas de un fichero.


Pueden ir acompañados de varias opciones (podéis consultar el manual con los comandos man cat o man head o man tail). La más utilizada es añadir un guión y un número para cambiar el número de líneas a mostrar en el caso de head y tail.


### Ejemplos


(1) Creamos un archivo en nuestro directorio home con un contenido cualquiera y lo mostramos en la terminal:

    
    $ cat /home/usuario/archivo.txt


(2) Ahora mostramos las** doce primeras líneas** de ese mismo archivo:

    
    $ head -12 /home/usuario/archivo.txt


[caption id="attachment_131" align="aligncenter" width="400"]![Ejemplo bash linux](http://www.univunix.com/wp-content/uploads/Captura-de-pantalla-de-2013-02-10-133330.png) Ejemplo real en una sesión de Bash[/caption]



[alert text="Nota para antiguos lectores de **niferniware.com**: este artículo ha sido movido por su autor desde _niferniware.com_ para que pase a formar parte de la comunidad. Ahora el artículo sólo podrá encontrarse en esta web para evitar contenidos duplicados."]

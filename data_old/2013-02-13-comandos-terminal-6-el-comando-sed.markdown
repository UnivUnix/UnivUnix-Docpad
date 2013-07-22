---
author: Ferthedems
comments: true
date: 2013-02-13 19:10:20+00:00
layout: post
slug: comandos-terminal-6-el-comando-sed
title: 'Comandos terminal (6): el comando sed'
wordpress_id: 138
categories:
- Linux
- Tutoriales
following_users:
- Ferthedems
tags:
- Bash
- Comandos
- Linux
- Sed
- Terminal
- Tutoriales
---

![terminal linux icon](http://www.univunix.com/wp-content/uploads/terminal_icon-150x150.jpg)Sed es uno de los **comandos más útiles** que he probado en la _terminal de Linux_ y mi preferido sin lugar a dudas. Nos **permite sustituir** de acuerdo a un patrón (una expresión regular) las cadenas de un texto, que o bien puede estar contenido en un archivo o bien puede venir de una redirección de la salida estándar de otro comando.




**También permite**, por ejemplo, **borrar líneas**.




_Sintaxis:_




    
    <em></em>sed [OPCIONES] 'expresión' [FICHERO]




Recomiendo el uso de **comillas simples** ya que nos resultarán a la larga **más versátiles** en el caso particular de este comando.




A continuación, veremos los _casos particulares más frecuentes_.





#### Borrar una línea



    
     sed [OPCIONES] 'numero_de_linead' [FICHERO]



    
    sed [OPCIONES] 'numero_de_linea_inicio,numero_de_linea_find' [FICHERO]



    
     sed [OPCIONES] '/expresion_regular/d' [FICHERO]


Y no, no hay ningún error. El **número de línea** debe ir seguido de la **letra d minúscula**. Asimismo, siempre que usemos **expresiones regulares** deberán ir metidas **entre barras "/"**.





#### Sustituir cadenas



    
    sed [OPCIONES] 's/cadena_A/cadena_B/' [FICHERO]


Un _truco_ es recordar la "s" como _"sustituir"_.






En este caso sencillamente se sustituye la cadena_A por la cadena_B, pero **sólo la primera vez que se encuentre cadena_A** en el texto.




Si lo que queremos es que se sustituyan **todas las cadenas que coincidan con cadena_A**, la sintaxis sería:



    
    sed [OPCIONES] 's/cadena_A/cadena_B/g' [FICHERO]




Finalmente, aunque esta opción no nos resulte tan útil, también podemos aplicar una **sustitución de cadena_A por cadena_B en una linea concreta** de un fichero:



    
    sed [OPCIONES] 'numero_de_linea s/cadena_A/cadena_B/g' [FICHERO]




______NOTA: En todos estos ejemplos, cadena_A y cadena_B pueden ser sustituidos por expresiones regulares.____







#### Aspectos a tener en cuenta





	
  * Cuando utilicemos **expresiones regulares** es recomendable incluir la opción **-r** , ya que en caso contrario algunas podrían no ser reconocidas.

	
  * Debemos tener **cuidado al trabajar sobre ficheros**, ya que el efecto de este comando podría ser **difícilmente reversible**.




#### Ejemplo


En este ejemplo haremos uso de [lo aprendido sobre expresiones regulares](http://www.univunix.com/linux/comandos-terminal-3-expresiones-regulares/). Vamos a tomar la salida del comando 'ls -a1', que serían todos los directorios _(incluidos los ocultos)_ del lugar en el que estemos, mostrados en una única columna. Lo pasaremos mediante una [tubería](http://www.univunix.com/linux/comandos-terminal-1-entrada-y-salida-estandar/) a _sed_, y en este caso _sed -r 's/^\..*/DIRECTORIO OCULTO/g' _lo que hará será sustituir todas las líneas que comiencen **(^)** por un punto **(\.)** seguido de varios caracteres **(.*)** por las palabras "DIRECTORIO OCULTO".



[caption id="attachment_159" align="aligncenter" width="612"]![comando sed Linux](http://www.univunix.com/wp-content/uploads/Captura-de-pantalla-de-2013-02-13-143821.png) Ejemplo en una sesión de Bash.[/caption]






---
author: Ferthedems
comments: true
date: 2013-02-12 09:00:32+00:00
layout: post
slug: comandos-terminal-3-expresiones-regulares
title: 'Comandos terminal (3): expresiones regulares'
wordpress_id: 135
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

_![regex image](http://www.univunix.com/wp-content/uploads/regex-thumb-150x150.jpg)"Una para representarlas a todas". _Una expresión regular o patrón se puede entender de forma intuitiva como un mecanismo para representar en un texto un conjunto de cadenas de caracteres que correspondan a una determinada estructura. Por ejemplo, las cadenas _web_, _wep_, _wet_, corresponderían con la expresión "we(b|t|p)".




**Metacarácter**: carácter con un _significado especial_ dentro de una expresión regular.




_Metacaracteres básicos que se utilizan en expresiones regulares:_






* * *





#### Metacaracteres de posicionamiento









Metacarácter
Significado







^


Simboliza "principio de línea".






$


Simboliza "final de línea".






\<


Simboliza "principio de palabra".






\>


Simboliza "final de palabra".






#### Metacaracteres de tipo de carácter









Metacarácter
Significado







. _(punto)_


Representa un _carácter cualquiera_.






\s


Representa un _espacio en blanco_.






\S


Representa un carácter cualquiera que **no sea** un espacio en blanco.






\d


Representa un _número_ (dígito).






\D


Representa un carácter cualquiera que **no sea** un número (dígito).






\w


Representa una _letra_.






\W


Representa aquello que **no sea** una letra.






#### Metacaracteres cuantificadores









Metacarácter
Significado







 *


Lo precedente repetido _cero o más_ veces.






+


Lo precedente repetido _una o más_ veces.






?


Lo precedente repetido _0 ó 1_ vez (opcionalidad)






{m} {m,} {m,n}


Lo precedente repetido **m**, **m o más**, **entre m y n** veces, respectivamente. Ejemplo: número binario de ocho bits (un byte): [01]{8}






#### Metacaracteres de lógicos y de rangos









Metacarácter
Significado







[ ]


Simboliza la posibilidad de un carácter cualquiera del conjunto comprendido entre los corchetes. Por ejemplo, [A-Z] sería el equivalente a "Un carácter cualquiera de la A a la Z (mayúsculas)".






[^ ]


 Simboliza un carácter cualquiera que no pertenezca al conjunto comprendido en los corchetes. Por ejemplo, [^A-Z] sería el equivalente a "Un carácter cualquiera que no pertenezca al conjunto de la A a la Z (mayúsculas)". Podrían ser, por ejemplo, una coma o una letra minúscula.






|


 "OR" lógico. Simboliza la alternativa: "o una cosa, o la otra".






( )


Agrupación de patrones. Ejemplo: ([0-9A-F]{2}:){5}[0-9A-F]{2} _[Formato de una dirección MAC de 48 bits]_







* * *




**¿Cómo anulamos el significado de un metacarácter?** Debemos preceder al metacarácter del símbolo \ _(barra invertida o backslash)_. Esto es válido para los metacaracteres ^ $ ( ) < [ { \ | > . * + ?





#### Ejemplos





	
  * Palabra, que empieza por mayúscula seguida de cuatro caracteres en minúscula: [A-Z][a-z]{4}

	
  * Cadena que empieza con una mayúscula, seguida de uno o más números, y acaba en punto: [A-Z][0-9]+\.

	
  * Cadena coincidente con las palabras _ingenio_, _ingenia_, _ingenie_: ingeni(o|a|e)


Ejemplo en la terminal:

    
    ls --all -1 | grep "^\."


Lista todo el contenido (--all) en una sola columna (-1) y filtra las líneas _(grep, que lo veremos en la próxima entrega)_ **que empiezan por punto**_(o lo que es lo mismo, **los directorios ocultos**)_.

El mismo ejemplo pero para directorios ocultos que empiezan por la letra "c":

[caption id="attachment_136" align="aligncenter" width="450"]![Ejemplo terminal Linux](http://www.univunix.com/wp-content/uploads/Captura-de-pantalla-de-2013-02-10-134423.png) Ejemplo en una sesión Bash[/caption]




> [Fuente](http://enavas.blogspot.com.es/2008/03/linux-expresiones-regulares.html) (1) [Fuente](http://es.scribd.com/doc/30378197/74/Caracteres-y-metacaracteres) (2) [Fuente](http://www.the-evangelist.info/2009/12/expresiones-regulares/) (3)




[alert text="Nota para antiguos lectores de **niferniware.com**: este artículo ha sido movido por su autor desde _niferniware.com_ para que pase a formar parte de la comunidad. Ahora el artículo sólo podrá encontrarse en esta web para evitar contenidos duplicados."]

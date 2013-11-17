---
authors: ['Ferthedems']
date: 2013-02-12 09:00:32+00:00
layout: post
title: 'Comandos terminal (3): expresiones regulares'
thumbnail: ['/attachments/2013/02/regex-thumb.jpg', 'Expresiones regulares']
categories: ['linux', 'tutoriales']
tags: ['bash', 'comandos', 'terminal']
---

_"Una para representarlas a todas". _Una expresión regular o patrón se puede entender de forma intuitiva como un mecanismo para representar en un texto un conjunto de cadenas de caracteres que correspondan a una determinada estructura. Por ejemplo, las cadenas _web_, _wep_, _wet_, corresponderían con la expresión "we(b|t|p)".

Ahora vemos  la definición de metacarácter:
**Metacarácter**: carácter con un _significado especial_ dentro de una expresión regular.

_Metacaracteres básicos que se utilizan en expresiones regulares:_
* * *

#### Metacaracteres de posicionamiento

<table class="table table-striped">
    <thead>
        <tr>
            <th>Metacarácter</th>
            <th>Significado</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>^</td>
            <td>Principio de línea.</td>
        </tr>
        <tr>
            <td>$</td>
            <td>Final de línea.</td>
        </tr>
        <tr>
            <td>\<</td>
            <td>Principio de palabra.</td>
        </tr>
        <tr>
        	<td>\></td>
        	<td>Final de palabra.</td>
        </tr>
    </tbody>
</table>

#### Metacaracteres de tipo de carácter

<table class="table table-striped">
	<thead>
		<tr>
			<th>Metacarácter</th>
			<th>Significado</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>*.(punto)*</td>
			<td>Representa un *carácter cualquiera*.</td>
		</tr>
		<tr>
			<td>\s</td>
			<td>Representa un *espacio en blanco*.</td>
		</tr>
		<tr>
			<td>\S</td>
			<td>Representa un carácter cualquiera que **no sea** un espacio en blanco.</td>
		</tr>
		<tr>
			<td>\d</td>
			<td>Representa Representa un *número* (dígito).</td>
		</tr>		
		<tr>
			<td>\D</td>
			<td>Representa un carácter cualquiera que **no sea** un número (dígito).</td>
		</tr>
		<tr>
			<td>\w</td>
			<td>Representa una *letra*.</td>
		</tr>
		<tr>
			<td>\W</td>
			<td>Representa aquello que **no sea** una letra</td>
		</tr>
	</tbody>
</table>

####Metacaracteres cuantificadores

<table class="table table-striped">
	<thead>
		<tr>
			<th>Metacarácter</th>
			<th>Significado</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>*</td>
			<td>Lo precedente repetido *cero o más* veces.</td>
		</tr>
		<tr>
			<td>+</td>
			<td>Lo precedente repetido *uno o más* veces.</td>
		</tr>
		<tr>
			<td>?</td>
			<td>Lo precedente repetido *cero o una* vez.</td>
		</tr>
		<tr>
			<td>{m} {m,} {m,n}</td>
			<td>Lo precedente repetido *m, m o más, y entre m y n* veces respectivamente.</td>
		</tr>
	</tbody>
</table>

####Metacaracteres lógicos y de rango

<table class="table table-striped">
    <thead>
        <tr>
            <th>Metacarácter</th>
            <th>Significado</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[  ]</td>
            <td>Simboliza la posibilidad de un carácter cualquiera del conjunto comprendido entre los corchetes. Por ejemplo, [A-Z] sería el equivalente a “Un carácter cualquiera de la A a la Z (mayúsculas)”.</td>
        </tr>
        <tr>
            <td>[^ ]</td>
            <td> Simboliza un carácter cualquiera que no pertenezca al conjunto comprendido en los corchetes. Por ejemplo, [^A-Z] sería el equivalente a “Un carácter cualquiera que no pertenezca al conjunto de la A a la Z (mayúsculas)”. Podrían ser, por ejemplo, una coma o una letra minúscula.</td>
        </tr>
        <tr>
            <td>|</td>
            <td> ”OR” lógico. Simboliza la alternativa: “o una cosa, o la otra”.</td>
        </tr>
        <tr>
            <td>( )</td>
            <td>Agrupación de patrones. Ejemplo: ([0-9A-F]{2}:){5}[0-9A-F]{2} [Formato de una dirección MAC de 48 bits]</td>
        </tr>
    </tbody>
</table>

**¿Cómo anulamos el significado de un metacarácter?** Debemos preceder al metacarácter del símbolo \ (barra invertida o backslash). Esto es válido para los metacaracteres ^ $ ( ) < [ { \ | > . * + ?

####Ejemplos
* Palabra, que empieza por mayúscula seguida de cuatro caracteres en minúscula: [A-Z][a-z]{4}
* Cadena que empieza con una mayúscula, seguida de uno o más números, y acaba en punto: [A-Z][0-9]+\.
* Cadena coincidente con las palabras ingenio, ingenia, ingenie: ingeni(o|a|e)

Ejemplo en la terminal:

    ls --all -1 | grep "^\."

Lista todo el contenido (--all) en una sola columna (-1) y filtra las líneas _(grep, que lo veremos en la próxima entrega)_ **que empiezan por punto**_(o lo que es lo mismo, **los directorios ocultos**)_.

El mismo ejemplo pero para directorios ocultos que empiezan por la letra "c":

<img alt="Ejemplo de una sesión de bash" src="/img/placeholder.gif" data-original="/attachments/2013/02/Captura-de-pantalla-de-2013-02-10-134423.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block;">

> [Fuente](http://enavas.blogspot.com.es/2008/03/linux-expresiones-regulares.html) (1) [Fuente](http://es.scribd.com/doc/30378197/74/Caracteres-y-metacaracteres) (2) [Fuente](http://www.the-evangelist.info/2009/12/expresiones-regulares/) (3)

<div class="alert alert-info">
Nota para antiguos lectores de **niferniware.com**: este artículo ha sido movido por su autor desde _niferniware.com_ para que pase a formar parte de la comunidad. Ahora el artículo sólo podrá encontrarse en esta web para evitar contenidos duplicados.
</div>



---
authors: ['Ferthedems']
date: 2013-02-12 09:00:32+00:00
layout: post
title: 'Comandos terminal (3): expresiones regulares'
categories: ['linux', 'tutoriales']
tags: ['bash', 'comandos', 'terminal']
---

_![regex image](http://www.univunix.com/wp-content/uploads/regex-thumb-150x150.jpg)"Una para representarlas a todas". _Una expresión regular o patrón se puede entender de forma intuitiva como un mecanismo para representar en un texto un conjunto de cadenas de caracteres que correspondan a una determinada estructura. Por ejemplo, las cadenas _web_, _wep_, _wet_, corresponderían con la expresión "we(b|t|p)".




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

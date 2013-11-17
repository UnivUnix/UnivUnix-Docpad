---
authors: ['Ferthedems']
date: 2013-02-13 09:01:07+00:00
layout: post
slug: comandos-terminal-5-cut-la-tijera
title: 'Comandos terminal (5): cut, "la tijera"'
thumbnail: ['/attachments/2013/02/3047309815_ee3a06ea04.jpg', 'Cut icon']
categories: ['linux', 'tutoriales']
tags: ['bash', 'comandos', 'terminal']
---

**Cut** es un comando de terminal que literalmente "corta" un texto del que se selecciona una columna o un campo separado por un delimitador.




Por ejemplo, un delimitador de campo podrían ser los dos puntos ":" en el caso de una dirección MAC que separa conjuntos formados por dos números y letras, cumpliendo con la forma:




_xx:xx:xx:xx:xx:xx donde x pueden ser números [1-9] o letras (A-F)._


_Sintaxis:_

    
    <em></em>cut -OPCIONES [ARCHIVO]


_Para el caso,_

    
    <em></em>cut -f numero_de_campo -d"delimitador" [ARCHIVO]




### Ejemplo de uso de cut


Tenemos un archivo de texto al que hemos llamado _prueba.txt_ con el siguiente contenido:

    
    192.168.1.100
    192.168.1.110
    192.168.1.112
    192.168.1.104
    192.168.1.116


Que vendrían a ser un **conjunto de IP**. Vamos a quedarnos con el último campo de cada IP, que serían los últimos tres números (aunque podrían ser dos o uno).

Por tanto, vemos que tenemos un conjunto de campos separados por un delimitador (el punto), y que el cuarto campo es el que contiene aquella parte que nos gustaría filtrar:

[caption id="attachment_153" align="aligncenter" width="550"]![Ejemplo Bash](http://www.univunix.com/wp-content/uploads/Captura-de-pantalla-de-2013-02-11-133548.png) Ejemplo en una sesión de Bash[/caption]
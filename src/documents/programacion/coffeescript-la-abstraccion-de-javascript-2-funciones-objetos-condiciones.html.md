---
authors: ['Aglezabad']
date: 2014-1-2 18:28:50+01:00
title: Coffeescript, la abstracción de Javascript (2): Funciones, objetos y condiciones.
layout: post
thumbnail: ['/attachments/2013/12/coffeescript.png', 'Logo de Coffeescript.']
categories: ['tutoriales','programación']
tags: ['coffeescript', 'javascript', 'web']
---
Esta es la segunda parte del artículo sobre Coffeescript, el cual es la traducción de la documentación original del lenguaje en cuestión. Después de haber explicado tanto la definición como la instalación y el uso del compilador, a continuación explicamos cómo se definen algunos de los elementos del lenguaje.

###Funciones
Las funciones son definidas como una lista opcional de parámetros situados entre paréntesis seguido de una flecha y el cuerpo de la función, con todas las instrucciones. Por ejemplo, una función vacía sería esto:

    ->

Y una función de ejemplo, con todos los elementos que la componen, es esto:

    square = (x) -> x * x
    cube   = (x) -> square(x) * x

También los parámetros pueden tener valores por defecto, que se aplican en caso de no haberse definido dicho parámetro. Por ejemplo:

    fill = (container, liquid = "coffee") ->
        "Filling the #{container} with #{liquid}..."

###Objetos y vectores.
La diferencia en la formación de objetos y vectores entre Coffeescript y Javascript es mínima, como podemos ver a continuación con unas definiciones en Coffeescript. Cabe decir que no es necesaria la coma si definimos una propiedad por línea y que podemos determinar la jerarquía del objeto mediante la tabulación.

    song = ["do", "re", "mi", "fa", "so"]
    
    singers = {Jagger: "Rock", Elvis: "Roll"}
    
    bitlist = [
      1, 0, 1
      0, 0, 1
      1, 1, 0
    ]
    
    kids =
      brother:
        name: "Max"
        age:  11
      sister:
        name: "Ida"
        age:  9

Visto el ejemplo, mostramos su equivalencia en Javascript:

    var bitlist, kids, singers, song;
    
    song = ["do", "re", "mi", "fa", "so"];
    
    singers = {
      Jagger: "Rock",
      Elvis: "Roll"
    };
    
    bitlist = [1, 0, 1, 0, 0, 1, 1, 1, 0];
    
    kids = {
      brother: {
        name: "Max",
        age: 11
      },
      sister: {
        name: "Ida",
        age: 9
      }
    };

###Condiciones if-else.
Las sentencias if-else pueden ser escritas sin la necesidad de incluir parentésis y llaves. Así como la definición de funciones y otros bloques de código, la jerarquía de sentencias está determinada por la tabulación de los elementos.

Como los ejemplos ayudan a comprender las explicaciones, no vamos a escatimar en su uso. Podrán ver a continuación el ejemplo en Coffeescript:

    mood = greatlyImproved if singing
    
    if happy and knowsIt
      clapsHands()
      chaChaCha()
    else
      showIt()
    
    date = if friday then sue else jill

<div class="alert alert-info">Podemos también usar <code>unless</code> para expresar <code>if not</code>. También podemos usar esta última expresión.</div>

Y con esto finaliza la segunda parte de Coffeescript. Para cualquier duda, no duden (obviamente) indicarla en los comentarios o accediendo a nuestro nuevo foro. También revisar la [documentación original de Coffeescript](http://coffeescript.org/) ayuda.

---
authors: ['Aglezabad']
date: 2014-01-22 20:05:50+01:00
title: Coffeescript, la abstracción de Javascript (3): Operadores y bucles.
layout: post
thumbnail: ['/attachments/2013/12/coffeescript.png', 'Logo de Coffeescript.']
categories: ['tutoriales','programación']
tags: ['coffeescript', 'javascript', 'web']
---
Continuando con la traducción de la documentación de Coffeescript, toca una sección más pequeña de lo normal. Hoy hablaremos de los operadores y los bucles que podemos realizar, para después hablar de cómo crear clases objeto en el próximo capítulo.

###Bucles

La mayoría de los bucles que podrás escribir en Coffeescript serán para realizar recorridos sobre arrays, objetos y rangos de valores. Dichos recorridos se reemplazan por bucles de tipo *for* en el momento de la compilación del código y, a diferencia de los bucles *for* de Javascript, estos pueden retornar valores y ser asignados en variables.

Un ejemplo de ello sería como el que tenemos a continuación:

    # Eat lunch.
    eat food for food in ['toast', 'cheese', 'wine']

Esto de aquí arriba realiza la función eat(food) por cada elemento del array. A continuación pueden verlo en su equivalente en Javascript:

    var food, _i, _len, _ref;
    
    _ref = ['toast', 'cheese', 'wine'];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        food = _ref[_i];
        eat(food);
    }

Por otra parte, tenemos las sentencias while y until. Estas últimas son útiles para crear bucles de longitud indefinida o para esperar una condición concreta. Mientras que **while** functiona igual que en cualquier lenguaje de programación, **until** es una sentencia de Coffeescript que permite crear bucles equivalentes a *while not*.

El ejemplo que mostramos a continuación está presente también en los ejemplos de la documentación original de Coffeescript. El mismo sirve para mostrar la diferencia entre while y until de una forma clara.

    # Econ 101
    if this.studyingEconomics
      buy()  while supply > demand
      sell() until supply > demand

Y este es su equivalente en Javascript:

    if (this.studyingEconomics) {
      while (supply > demand) {
        buy();
      }
      while (!(supply > demand)) {
        sell();
      }
    }

Aunque queda gran cantidad de información sobre recorridos de vectores y objetos en Coffeescript, este pequeño resumen pretende dejar claro lo básico.

###Operadores

A nivel de operadores de igualdad, Coffeescript marca una gran diferencia respecto a Javascript, ya que solamente permite la comparación <code>===</code> y <code>!==</code> para evitar la ambigüedad que hay entre <code>==</code>, <code>===</code> y sus equivalentes negativos.

También este lenguaje tiene asociados unos alias a cada operador, con el fin de simplificar la programación. A continuación mostramos una tabla con todas las equivalencias.

<table class="table table-striped">
    <thead>
        <tr>
            <th>Coffeescript</th>
            <th>Javascript</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>is</td>
            <td>===</td>
        </tr>
        <tr>
            <td>isnt</td>
            <td>!==</td>
        </tr>
        <tr>
            <td>not</td>
            <td>!</td>
        </tr>
        <tr>
            <td>and</td>
            <td>&&</td>
        </tr>
        <tr>
            <td>or</td>
            <td>||</td>
        </tr>
        <tr>
            <td>true, yes, on</td>
            <td>true</td>
        </tr>
        <tr>
            <td>false, no, off</td>
            <td>false</td>
        </tr>
        <tr>
            <td>@, this</td>
            <td>this</td>
        </tr>
        <tr>
            <td>of</td>
            <td>in</td>
        </tr>
        <tr>
            <td>in</td>
            <td>*Palabra propia de Coffeescript* </td>
        </tr>
        <tr>
            <td>?</td>
            <td>*Operador existencial*</td>
    </tbody>
</table> 

<div class="alert alert-info">El término **in** se utiliza para expresar "entre estos elementos" y su uso se aplica a expresiones que contengan arrays.</div>

<div class="alert alert-info">El término **?** se utiliza para comprobar si una variable es distinta de null o de undefined. Su uso se extiende a las condicionales if y unless.</div>

Y a continuación, el correspondiente ejemplo:

    launch() if ignition is on

    volume = 10 if band isnt SpinalTap

    letTheWildRumpusBegin() unless answer is no

    if car.speed < limit then accelerate()

    winner = yes if pick in [47, 92, 13]

    print inspect "My name is #{@name}"

Con su correspondiente equivalencia en Javascript:

    var volume, winner;
    
    if (ignition === true) {
      launch();
    }
    
    if (band !== SpinalTap) {
      volume = 10;
    }
    
    if (answer !== false) {
      letTheWildRumpusBegin();
    }
    
    if (car.speed < limit) {
      accelerate();
    }
    
    if (pick === 47 || pick === 92 || pick === 13) {
      winner = true;
    }
    
    print(inspect("My name is " + this.name));

Y con esto, finaliza la parte de operadores y bucles. En la próxima parte hablaremos de cómo crear clases y objetos en Coffeescript. Para cualquier duda, podéis exponerla a través del [foro](http://forum.univunix.com) o buscar la información necesaria en la [documentación de Coffeescript.](http://coffeescript.org/)
---
authors: ['Aglezabad']
date: 2014-2-9 21:36:50+01:00
title: Coffeescript, la abstracción de Javascript (4): Programación orientada a objetos.
layout: post
thumbnail: ['/attachments/2013/12/coffeescript.png', 'Logo de Coffeescript.']
categories: ['tutoriales','programación']
tags: ['coffeescript', 'javascript', 'web']
---

Hoy finaliza el resumen y traducción de la documentación de Coffeescript, mencionando en última instancia la programación orientada a objetos. Para cumplir con dicho paradigma, debemos definir clases, lo cual es muy sencillo en Coffee.

Realizar este tipo de programación en Javascript es un auténtico quebradero de cabeza para todo aquel no familiarizado con la creación y el uso de los prototipos. Esto obligaba a usar diversas librerías que facilitaban dicha tarea, como pueden ser Base2, Prototype.JS o JS.Class.

En lugar de unir funciones a un prototipo de forma repetitiva, Coffeescript tiene una forma de expresar las clases parecida a la forma que tiene para definir los objetos en dicho lenguaje. He aquí un ejemplo:

<br/>

    class Animal
      constructor: (@name) ->
      
      move: (meters) ->
        alert @name + " moved #{meters}m."

La primera función la nombramos *constructor* para que sea el constructor de la clase en cuestión. Por ello, dicho nombre es reservado.
Para las funciones, les asignamos un nombre válido para que puedan ser llamadas.

Como siempre se ha hecho en estos artículos, vamos a mostrar la equivalencia correspondiente en Javascript. Recordamos que en Javascript se usan los atributos prototipo para la generación de métodos asociados a una clase.

    Animal = (function() {
      function Animal(name) {
        this.name = name;
      }
      
      Animal.prototype.move = function(meters) {
        return alert(this.name + (" moved " + meters + "m."));
      };
      
      return Animal;
      
    })();

Por otra parte, Coffeescript tiene la posibilidad de realizar herencia de clases de forma sencilla, ya que nos ahorramos todo el código que habría que programar en Javascript para tal tarea. Con un ejemplo podremos verlo mejor:

    class Snake extends Animal
      move: ->
        alert "Slithering..."
        super 5
      
    class Horse extends Animal
      move: ->
        alert "Galloping..."
        super 45

Aparte de la herencia, Coffeescript nos permite utilizar las funciones de la clase padre mediante el uso de la llamada *super*, la cual tiene una traducción un tanto especial en Javascript. Para que podáis ver la gran diferencia entre ambos lenguajes, vamos a mostrar las partes en el siguiente orden: la equivalencia de *extends* en Javascript y también con las clases *Snake* y *Horse*.

    //Equivalencia extends.
    __extends = function(child, parent) {
      for (var key in parent) {
        if (__hasProp.call(parent, key)) 
          child[key] = parent[key];
      } 
      function ctor() {
        this.constructor = child;
      }
      ctor.prototype = parent.prototype;
      child.prototype = new ctor();
      child.__super__ = parent.prototype;
      return child;
    };

    //Equivalencia clases Snake y Horse
    Snake = (function(_super) {
      __extends(Snake, _super);
       
      function Snake() {
        return Snake.__super__.constructor.apply(this, arguments);
      }
       
      Snake.prototype.move = function() {
        alert("Slithering...");
        return Snake.__super__.move.call(this, 5);
      };
      
      return Snake;
      
    })(Animal);
      
    Horse = (function(_super) {
      __extends(Horse, _super);
    
      function Horse() {
        return Horse.__super__.constructor.apply(this, arguments);
      }
      
      Horse.prototype.move = function() {
        alert("Galloping...");
        return Horse.__super__.move.call(this, 45);
      };
      
      return Horse;
      
    })(Animal);

Otra forma de acceder al atributo prototipo del objeto para añadir métodos adicionales es mediante el uso del carácter <code>::</code>. El ejemplo a continuación lo muestra.

    String::dasherize = ->
      this.replace /_/g, "-"

Este fragmento de código equivale a la siguiente muestra en Javascript:

    String.prototype.dasherize = function() {
      return this.replace(/_/g, "-");
    };

Esto permite, según la forma que lo interpreto, crear functiones de clases ya creadas, permitiendo su ampliación en el momento que lo consideremos oportuno.

Y con esto, a pesar de existir más funcionalidades de las mencionadas en esta guía de cuatro capítulos, os invito a descubrir por vosotros mismos las partes restantes en la [página oficial de Coffeescript](http://coffeescript.org). Para cualquier duda, podéis comunicarla a través de los comentarios o desde nuestro [foro](http://www.univunix.com/forum).
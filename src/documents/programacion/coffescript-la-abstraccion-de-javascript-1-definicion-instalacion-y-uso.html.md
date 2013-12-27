---
authors: ['Aglezabad']
date: 2013-12-27 13:12:50+01:00
title: Coffeescript, la abstracción de Javascript (1): Definición, instalación y uso del compilador.
layout: post
thumbnail: ['/attachments/2013/12/coffeescript.png', 'Logo de Coffeescript.']
categories: ['tutoriales','programación']
tags: ['coffeescript', 'javascript', 'web']
---
Con el fin de facilitar la comprensión del lenguaje Coffeescript, se ha realizado la traducción de la documentación disponible en la [página web original](http://coffeescript.org).

**Coffescript es un pequeño lenguaje cuyo resultado de compilación es Javascript.** La intención de este lenguaje es mostrar las capacidades de Javascript bajo un punto de vista más sencillo y simple.

La regla de oro de Coffeescript es que *"solamente es Javascript"*. El código se compila a una equivalencia 1-1 con Javascript y no hay ningún tipo de interpretación por medio; esto permite el uso de librerías JS en CoffeeScript y viceversa y que el código resultante sea legible y mostrado de la mejor forma posible. Además, es compatible con cualquier motor Javascript con casi el mismo rendimiento que haber hecho el código directamente.

La última versión a día de haber escrito este artículo es la *1.6.3*, la cual se puede instalar con npm, el gestor de paquetes de NodeJS.

    sudo npm install -g coffee-script

###Resumen
Este es un código escrito en Coffeescript:

    # Asignaciones:
    number   = 42
    opposite = true
    
    # Condiciones:
    number = -42 if opposite
    
    # Functiones:
    square = (x) -> x * x
    
    # Vectores:
    list = [1, 2, 3, 4, 5]
    
    # Objetos:
    math =
      root:   Math.sqrt
      square: square
      cube:   (x) -> x * square x
    
    # Otra forma de expresar funciones:
    race = (winner, runners...) ->
      print winner, runners
    
    # Otro tipo de condición:
    alert "I knew it!" if elvis?
    
    # Vectores formados a partir de funciones:
    cubes = (math.cube num for num in list)

Y este es su equivalente en Javascript:

    var cubes, list, math, num, number, opposite, race, square,
      __slice = [].slice;
    
    number = 42;
    
    opposite = true;
    
    if (opposite) {
      number = -42;
    }
    
    square = function(x) {
      return x * x;
    };
    
    list = [1, 2, 3, 4, 5];
    
    math = {
      root: Math.sqrt,
      square: square,
      cube: function(x) {
        return x * square(x);
      }
    };
    
    race = function() {
      var runners, winner;
      winner = arguments[0], runners = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return print(winner, runners);
    };
    
    if (typeof elvis !== "undefined" && elvis !== null) {
      alert("I knew it!");
    }
    
    cubes = (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = list.length; _i < _len; _i++) {
        num = list[_i];
        _results.push(math.cube(num));
      }
      return _results;
    })();

###Instalación

El compilador de Coffeescript está escrito en dicho lenguaje, utilizando el generador Jison. Además, el compilador está disponible como una utilidad de NodeJS o como una aplicación cliente de Javascript. En la página original, hay disponible un botón llamado "Try Coffeescript", el cual es dicho compilador.

Para instalar Coffeescript, debes tener una versión estable de NodeJS y npm. Con ello, ejecutamos la instalación desde npm:

    npm install -g coffee-script

*(quita la opción -g si no quieres instalarlo a nivel global)*

Otra alternativa a esto es si quieres la versión más reciente del código fuente. Puedes clonar el repositorio que hay disponible en GitHub e instalar dicha versión:

    npm install -g http://github.com/jashkenas/coffee-script/tarball/master

###Uso

Una vez instalado, deberías tener acceso al comando <code>coffee</code>, el cual puede ejecutar scripts, compilar ficheros <code>.coffee</code> en ficheros <code>.js</code> y proveer un REPL interactivo.

Las siguientes opciones son:

<table class="table table-striped">
    <thead>
        <tr>
            <th>Opción</th>
            <th>Significado</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>-c, --compile</td>
            <td>Compila un fichero coffee en un fichero javascript.</td>
        </tr>
        <tr>
            <td>-m, --map</td>
            <td>Genera mapas de las fuentes junto con los ficheros Javascript. También añade directivas sourceMappingURL al Javascript.</td>
        </tr>
        <tr>
            <td>-i, --interactive</td>
            <td>Lanza una sesión interactiva de Coffeescript para la prueba de pequeños fragmentos de código. Es igual esta opción a llamar al proceso <code>coffee</code> sin argumentos.</td>
        </tr>
        <tr>
            <td>-o, --output [DIR]</td>
            <td>Directorio de destino de los ficheros compilados. Requiere usar --compile o --watch.</td>
        </tr>
        <tr>
            <td>-j, --join [FILE]</td>
            <td>Antes de compilar, concatena todos los scripts en el orden que fueron introducidos y los introduce en el fichero especificado. Útil para construir grandes proyectos.</td>
        </tr>
        <tr>
            <td>-w, --watch</td>
            <td>Comprueba si los ficheros fuente tienen algún tipo de modificación, para recompilarlos si es necesario.</td>
        </tr>
        <tr>
            <td>-p, --print</td>
            <td>En lugar de guardarlo en un fichero <code>.js</code>, el resultado de la compilación se muestra por la salida estándar.</td>
        </tr>
        <tr>
            <td>-s, --stdio</td>
            <td>El compilador utiliza la entrada y salida estándar para realizar su proceso. Ejemplo: cat src/file.coffee | coffee -sc</td>
        </tr>
        <tr>
            <td>-l, --literate</td>
            <td>Procesa los ficheros coffee como "literate coffeescript". Solo es necesario usar este argumento cuando usas la opción -s.</td>
        </tr>
        <tr>
            <td>-e, --eval</td>
            <td>Compila e imprime un fragmento de código directamente de la línea de comandos. Ejemplo: coffee -e "console.log num for num in [10..1]"</td>
        </tr>
        <tr>
            <td>-b, --bare</td>
            <td>Compila el código sin la capa de seguridad de alto nivel.</td>
        </tr>
        <tr>
            <td>-t, --tokens</td>
            <td>En lugar de compilar el Coffeescript, solamente realiza el análisis léxico, mostrando los tokens usados en la salida.</td>
        </tr>
        <tr>
            <td>-n, --nodes</td>
            <td>En lugar de compilar, realiza el análisis lexicosintáctico y muestra el arbol de referencias.</td>
        </tr>
        <tr>
            <td>--nodejs</td>
            <td>Introduce argumentos a NodeJS.</td>
        </tr>
    </tbody>
</table>

Y eso es todo de momento. En la pŕoxima parte, vendrá la traducción de la documentación acerca de las funciones, condiciones y bucles. Para más información, es recomendable ir a la [página oficial](http://coffeescript.org). 





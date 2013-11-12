---
authors: ['Aglezabad']
date: 2013-01-18 14:57:06+00:00
layout: post
title: Adapta tu tema Wordpress a HTML5 válido.
thumbnail: ['/attachments/2013/01/HTML5_Logo_512.png', 'Logo de HTML5']
categories: ['tutoriales', 'programación']
tags: ['estándares', 'html5', 'php', 'seo', 'temas', 'wordpress']
---

[![HTML5 logo](http://www.univunix.com/wp-content/uploads/HTML5_Logo_512-300x300.png)](http://www.univunix.com/wp-content/uploads/HTML5_Logo_512.png)Desde el año pasado, se ha promovido por parte de compañías como Google el uso de la última revisión del lenguaje HTML. HTML5 otrorga múltiples cambios, tales como la división del espacio del cuerpo en diversas secciones con nombre propio, tales como <header>,<footer> o <article>; facilitando la comprensión del diseño. Por su parte, tanto los desarrolladores de Wordpress como aquellos que crean diseños para este gestor de contenidos, ya están sacando a la luz una gran cantidad de temas con los que personalizar nuestra web.

El único inconveniente que puede haber es la no-validez del contenido html por parte del validador W3C, organización que determina el estándar de los formatos web. Los problemas que causan este resultado son producidos por parte del software gestor y por parte del diseño en sí, ya que pudo dejar de ser válido si ha habido cambios de atributos en alguna revisión del lenguaje. Esto último hace que algunos temas recientes no tengan validez plena.

También tendremos en cuenta los microformatos, ya que algunos desarrolladores usan microformatos no válidos o en espera de ser validados. Así pues, comenzamos a arreglar nuestro tema.


### Eliminar el microformato "category tag"


Uno de los primeros problemas que hay cuando adaptamos un tema son estos atributos. Los atributos ' rel="category tag" ' los añade el propio núcleo de Wordpress para asociar los enlaces que apuntan a categorías para relacionarlos con una especie de etiqueta, Esta etiqueta se llama microformato y sirve, sobre todo, para asignar propiedades a un contenido concreto. Por ejemplo, Google usa microformatos para relacionar una página web con su autor.

¿Y por qué el validador W3C lo considera un error? La respuesta se encuentra en lo siguiente:** "category tag" no pertenece a la[ lista de microformatos](http://microformats.org/wiki/existing-rel-values)**. Con el tiempo es posible que se convierta en un microformato válido, pero como no es así, debemos quitarlo.

La única complicación para quitar este microformato no válido es añadir un filtro a wordpress, asociando una función que reemplace ' rel="category tag" ' por un campo vacío.

    
    //Language: PHP
    add_filter( 'the_category', 'replace_cat_tag' );
    
    function replace_cat_tag ( $text ) {
    $text = str_replace('rel="category tag"', '', $text); return $text;
    }


Esta función es muy común y en múltiples sitios web explican esta parte.


### Evitar usar ' rel="publisher" ' (Google +)


[![Google Plus](http://www.univunix.com/wp-content/uploads/googleplus-300x160.jpg)](http://www.univunix.com/wp-content/uploads/googleplus.jpg)No solamente "category tag" es repudiado por la W3C, también **el microformato "publisher" no está declarado en la lista y, por ello, no es válido.** Para dar algo de información, "publisher" es un microformato que promueve Google para asociar una página de Google+ con el sitio web o empresa al que está relacionado. Esto añade gran valor al SEO y desarrollo de una web, pero hace que nuestro diseño ya no sea estándar.

Durante mucho tiempo, no había alternativa alguna para relacionar nuestra web con Google+, pero gracias a [un estado de Gerwin Sturm](https://plus.google.com/112336147904981294875/posts/b8CczJQDdLc) se ha hallado una vía para validar nuestro tema. Si tenemos un enlace a nuestra página de Google +, podemos cambiar sutilmente su forma para que tenga la relación incorporada al enlace.

    
    <a title="Síguenos en Google Plus" target="_blank" href="http://plus.google.com/b/(id_perfil)<strong>?rel=publisher</strong>"></a>


Con añadir "?rel=publisher" a nuestro enlace, conseguimos el mismo resultado y quitamos un error de validación bastante desconocido de arreglar (a pesar de existir solución desde 2011). Con ' rel="author" ' no sucede este problema de validez, así que se puede implementar la forma que indica Google.


### Eliminar "pubdate" de la etiqueta "<time>" y adaptar fechas a formato válido.


En HTML5 existe una nueva etiqueta, denominada "<time>", cuya funcionalidad es la de marcar el momento en el que se hace una acción o evento.El único inconveniente es la existencia de algún problema al utilizar múltiples etiquetas time, por no saber cuál es la que indica la fecha de publicación. Para ello, se planteó el uso del atributo "pubdate", que indicaría la fecha de publicación. Al parecer, este atributo sigue en el limbo de la validez y no se sabe cuándo se aprobará como estándar, así que es necesario quitarlo.

También es muy fácil, las etiquetas time siguientes:

    
    <time datetime="<?php echo the_time('Y-m-j'); ?>" <strong>pubdate</strong>><?php the_time(get_option('date_format')); ?></time>


tienen que quedar como estas:

    
    <time datetime="<?php echo the_time('Y-m-j'); ?>"><?php the_time(get_option('date_format')); ?></time>


Y con ello se evita unos cuantos errores.

**Actualización: **Es probable que siga habiendo problemas de validación en la etiqueta time en fechas comprendidas entre el 1 y el 9 de cada mes, indicando formato de time no válido. La solución se encuentra en sustituir:

    
    <time datetime="<?php echo the_time(<strong>'Y-m-j'</strong>); ?>"><?php the_time(get_option('date_format')); ?></time>


por

    
    <time datetime="<?php echo the_time(<strong>'c'</strong>); ?>"><?php the_time(get_option('date_format')); ?></time>


haciendo que las etiquetas de tiempo estén formateadas como ISO 8601, que es compatible con HTML5.


### Revisar la estructura HTML y PHP.


Y el último consejo es un consejo muy genérico: revisa tu código con la ayuda del "W3C validator" y arregla los fallos comunes que pueda haber. La mayoría de estos errores son causados por algún pequeño fallo al programar las sentencias en PHP (Los temas de Wordpress son HTML y PHP combinados) y también por añadir etiquetas que pertenecen a HTML 4.0 o XHTML y no estén contempladas en HTML 5.

Como conclusión, cabe decir que este pequeño tutorial menciona soluciones rápidas y demasiado sencillas (excepto la del atributo "publisher"), pero evitamos hacer estos pasos para evitar problemas mayores, cosa que no sucede. Aparte, este tutorial no entra en detalles de HTML5, ya que el propio validador te indica una explicación genérica útil para temas no relacionados con los que hemos hablado.

Esperamos que hayas conseguido tu tema en HTML 5 estándar. Aquí muestro [el resultado del tema de nuestra web](http://validator.w3.org/check?uri=http%3A%2F%2Fwww.univunix.com%2F&charset=%28detect+automatically%29&doctype=Inline&group=0&user-agent=W3C_Validator%2F1.3), después de aplicar estos consejos.



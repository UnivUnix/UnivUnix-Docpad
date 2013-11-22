---
author: Aglezabad
comments: false
date: 2012-11-29 14:47:08+00:00
layout: post
slug: evitar-contar-trackbacks-en-wordpress
title: Cómo evitar que el contador de comentarios incluya los trackbacks en Wordpress.
wordpress_id: 663
categories:
- Tutoriales
tags:
- PHP
- Web
- Wordpress
---

[caption id="attachment_670" align="alignleft" width="300"][![Página admin de comentarios, donde cuenta los pingbacks.](http://www.interusers.eu/wp-content/uploads/2012/11/coms-300x214.png)](http://www.interusers.eu/wp-content/uploads/2012/11/coms.png) Esta es la página de administración, donde vemos que los pingbacks son contados como comentarios. Eso es lo que vamos a evitar en las zonas ajenas al admin.[/caption]

Es normal que, como cualquier web que crezca, sea mencionada en otro sitios por sus acciones o inacciones. Eso genera una especie de "comentario" llamado trackback o pingback, el cual incluye la web que te mencionó. Ya sea por un motivo concreto (no llenar de enlaces una web y ser penalizado por Google) o por desconocimiento, no mostramos dichos pingbacks (que no es lo mismo que prohibir los mismos), pero el contador de comentarios, en este caso en Wordpress, aumenta cuando no debería.

Para tener un valor real de los comentarios de una página, podemos recurrir al uso de los filtros de wordpress, los cuales se puede modificar el funcionamiento sin cambiar el código del CMS. Luca Scarpa ya hizo función semejante, la cual modifica dos funciones de wordpress para el contador de comentarios (comments_number y get_comments_number).

Apenas he hecho ningún cambio sobre la función, así que os dejo [el tutorial que está en su web](http://www.luscarpa.com/snippets/wordpress/comments-number-without-pingbacks-and-trackbacks/).

El funcionamiento de la función es el siguiente: Si no está en una zona de administradores (wp-admin), del total de comentarios aprobados se restan los trackbacks; en caso contrario, muestra el contador tal como está.

Es una función muy sencilla, así que no es complicado entenderla.

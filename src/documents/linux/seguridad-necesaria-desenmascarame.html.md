---
authors: ['Aglezabad']
date: 2013-11-22 12:49:40+01:00
layout: post
slug: seguridad-necesaria-desenmascarame
title: 'La seguridad es necesaria: desenmascara.me'
categories: ['linux']
tags: ['seguridad','servidores','software','web']
---

De parte de [Security by default](http://www.securitybydefault.com/2013/01/grandes-empresas-sobre-pequenas-y.html?utm_source=twitterfeed&utm_medium=twitter), hoy nos encontramos con una herramienta web necesaria en términos de seguridad. Desenmascara.me comprueba distintos metadatos y headers HTTP de la web solicitada en busca de datos que puedan facilitar un ataque al mismo, tales como la versión y el nombre del servidor web en uso, y penaliza a aquellos sitios que utilizan software sin actualizar o la inacción ante diversos exploits.

He percibido, en lo que llevo de tiempo estudiando mi carrera, que hay que intentar complicar la tarea de los atacantes, poniendo diversos sistemas de seguridad y seguir una política de actualizaciones, sabiendo cuáles deben instalarse y cuáles es recomendable no incluir. Una forma de dificultar los ataques es evitando difundir datos que identifiquen qué software o plataforma usamos en nuestros servicios; eso es la seguridad por <del>ocultación</del> oscuridad.

Como debía ser, he probado el servicio y he recibido unos resultados que me alegran en profundidad.Con una configuración no tan centrada en la seguridad informática, he logrado superar el aprobado en la prueba. Aquí abajo podéis ver el resultado:

<img alt="Resultados desenmascara.me" src="/img/placeholder.gif" data-original="/attachments/2013/11/desenmascarame-result.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

Me llama bastante la atención recibir una puntuación de 35 puntos usando un servidor en casa con GNU/Linux, sin centrarme en la configuración y en la seguridad, y que haya grandes empresas (algunas de ellas en el ibex35 de la bolsa española) que sigan usando software desactualizado y sin ocultar de ninguna forma los datos de sus servidores, recibiendo puntuaciones de -5.

Bueno, no debería dar lecciones de seguridad a nadie, ya que estaba gritando a los cuatro vientos que usaba wordpress por incluir en los metadatos información de uno de sus plugins. En resumen, esta web nos ayudará un poco más en lograr unos servicios web lo más seguros y fiables posibles.

Web: [desenmascara.me](http://desenmascara.me)

**Fe de erratas:** No es seguridad por ocultación, el nombre correcto es seguridad por oscuridad.

<div class="alert alert-info">
Este artículo ha sido migrado desde **Interusers** a UnivUnix, ante el cierre de este primero.
</div>
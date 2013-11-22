---
author: Aglezabad
comments: true
date: 2012-04-04 23:04:28+00:00
layout: post
slug: instalar-hardware-actual-en-sistemas-antiguos
title: Cómo instalar hardware actual en sistemas "no tan actuales".
wordpress_id: 126
categories:
- Tutoriales
tags:
- Hardware
- HDD
- IDE
- SATA
---

[![Disco duro SATA.](http://www.interusers.eu/wp-content/uploads/2012/04/discodurosata-300x206.jpg)](http://www.interusers.eu/wp-content/uploads/2012/04/discodurosata.jpg)La rapidez en los avances tecnológicos en la informática y sus nuevos componentes pueden hacer que el equipo que teníamos hace 4 años haya podido quedar bastante obsoleto. Una manera de evitar el desecho de ordenadores con capacidad de trabajo razonable es la retro-compatibilidad: los componentes más recientes pueden ser compatibles con sistemas de generación anterior en casos determinados.

Pero a menudo, debido a la antigüedad de esos sistemas, la retro-compatibilidad no funciona como se había esperado. Lo normal, en las interfaces SATA, las que se hablan en este artículo. Normalmente, los fabricantes de hardware tienen un sistema para detectar la velocidad de transferencia y así configurarse automáticamente, pero vuelve a entrar la antigüedad del equipo como posible problema. He aquí una breve explicación de qué hacer.<!-- more -->

Normalmente, todos los discos sata 2 actuales (y también se aplica a discos sata 3 para sistemas con sata 2) disponen en su firmware (el software encargado de hacerlo funcionar) un sistema de negociación automática, es decir, es el disco quien detecta la velocidad de transferencia y se configura para esa interfaz. Es sencillo y no hay que tocar nada, pero su inconveniente es la incompatibilidad con placas base antiguas (como algunas placas con controladoras marca VIA). Para ello, las compañías de discos duros actuales en mercado disponen de un apartado para explicar el cómo configurarlos mediante un jumper. He aquí las configuraciones de las marcas (están en inglés, pero hay suficientes imágenes explicativas):

[Western Digital](http://wdc.custhelp.com/app/answers/detail/a_id/1536#jumper)
[Seagate/Maxtor](http://www.seagate.com/ww/v/index.jsp?locale=en-US&name=Serial_ATA_Jumpers_and_Cabling&vgnextoid=4a02242cb043e010VgnVCM100000dd04090aRCRD)

¿Alguna duda? Coméntala en el foro.

---
author: Aglezabad
comments: true
date: 2012-04-07 20:22:11+00:00
layout: post
slug: dual-boot-en-placas-base-uefi
title: Cómo realizar un "dual boot" correcto en placas base UEFI.
wordpress_id: 138
categories:
- Tutoriales
tags:
- BIOS
- GRUB
- Hardware
- Linux
- UEFI
- Windows
---

A medida que avanza la tecnología y los límites establecidos son superados, se descubren nuevos sistemas y programas para realizar funciones mejoradas y alcanzar límites inesperados. He aquí UEFI, el software ROM sustituto de la BIOS.

UEFI proviene de Extensible Firmware Interface. Este nuevo sistema de arranque permite ejecutar un entorno gráfico mínimo necesario para realizar de forma sencilla las mismas tareas que se realizaban con el anterior sistema BIOS. Dicho sistema también permite soportar discos duros con tamaño superior a 2.2TB de tamaño, los cuales han salido al mercado (ya hay algunos modelos de 2TB y de 3TB).

Otra novedad de UEFI es la posibilidad de tener su propio gestor de arranque en el propio sistema, permitiendo arrancar directamente un sistema operativo determinado desde el mismo, bajo un estricto entorno de seguridad. <!-- more -->He aquí nuestro mayor problema, ya que dicho sistema necesita unas claves seguras firmadas. Con Windows no tendríamos problema, ya que tiene dichas claves, pero GNU/Linux, al ser un sistema libre, sus claves no son firmadas (por interés quizá de algunas empresas. Si algún gurú de Linux me ilumina en este apartado, se lo agradeceré)  y, con ello, la seguridad de UEFI se ve comprometida y no lo acepta en su gestor de arranque. Al menos eso fue lo que me sucedió al instalar Debian después de Windows 7.

¿Por qué esto es un problema? Como verá, si UEFI no permite el arranque de GNU/Linux, sólo puede tener como sistema principal un sistema MS-Windows Vista o superior (¿quién usa Vista?). Esto trae los dos problemas siguientes: no podrás arrancar otro sistema operativo, ni siquiera un liveCD, ya que UEFI realiza arranque directo a Windows; y, si intentas instalar GNU/Linux, no verás ninguna partición en el disco que instalaste Windows, provocando grandes dolores de cabeza.

Por ello, para realizar un dual-boot , es decir, tener ambos sistemas, deberás realizar la instalación de ambos sistemas operativos en modo no-UEFI, ya que evitas crear el sector de arranque UEFI, el cual  guarda en un espacio superior al tamaño MBR.
Para saber si estamos arrancando un instalador en modo UEFI, en dicho sistema, el arranque de tu CD, DVD o pendrive de instalación te saldrá con la etiqueta "UEFI" (al menos en placas base ASUS), deberíamos acceder a nuestro menú de arranque (Boot menu) con la tecla correspondiente y arrancar el mismo dispositivo desde la entrada que no indique UEFI al inicio.

Realizaremos la típica instalación de Windows en primer lugar, instalando GNU/Linux después. esto permitirá usar el gestor de arranque GRUB en lugar del gestor UEFI.

Cabe recordar que esto es un método genérico debido a una situación de firmado de claves que, en un posible futuro cercano, se solucione, porque todos los sistemas operativos actuales soportan el nuevo software de gestión.

P.D: Hay formas de conseguir hacer funcionar el gestor UEFI con GNU/Linux y Windows a la vez, pero pocas distribuciones permiten dicha forma. Por ejemplo, Debian necesita este método para instalarse (al menos he intentado hacerlo por UEFI y no logré resultados) , mientras que en Ubuntu es posible debido a su liveCD y unas guías disponibles.

Espero que te sirva de ayuda y si hay algún problema, puedes preguntarla en el[ foro](http://foro.interusers.eu).

Fe de erratas: Cuando mencionaba que las claves de Linux son públicas, es rotundamente falso. Las claves de seguridad nunca se muestran en el código fuente.

Nueva fe de erratas: Sobre las claves y firmas de seguridad no tengo ni idea de cómo van, pero parece no aceptarlas ninguna EFI actual.


Este tutorial está registrado bajo la licencia creative commons.
[![Licencia de Creative Commons](http://www.interusers.eu/wp-content/uploads/2012/04/88x311.png)](http://creativecommons.org/licenses/by-nc-sa/3.0/)
Tutorial Interusers: Cómo realizar un "dual boot" correcto en placas UEFI (v2). by [A.Gonzalez (Aglezabad)](http://www.interusers.eu/2012/dual-boot-en-placas-base-uefi/) is licensed under a [Creative Commons Reconocimiento-NoComercial-CompartirIgual 3.0 Unported License](http://creativecommons.org/licenses/by-nc-sa/3.0/).

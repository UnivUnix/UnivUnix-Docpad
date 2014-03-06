---
authors: ['Aglezabad']
date: 2014-03-03 19:51:49+01:00
layout: post
title: OpenCV en Sabayon: Dos formas de conseguirlo.
thumbnail: ['/attachments/2014/03/opencv-sabayon.png', 'OpenCV en Sabayon']
categories: ['linux', 'sabayon']
tags: ['openCV', 'instalar']
---

Mucha gente pensará que intentar instalar las bibliotecas de openCV en una distribución que no sea ni Ubuntu ni Debian puede ser un caos destructivo cuyos resultados sean completamente impredecibles. Pero puedo deciros que esto no es así, ya que al menos, en Sabayon, disponemos de dos formas (por no decir tres si incluimos el uso de portage) de conseguir nuestro objetivo.

<br/>
<br/>
<br/>

###La forma sencilla: Equo (o Rigo por GUI).

Tal como indica el título de la sección, OpenCV está disponible como paquete de instalación en esta distribución, así que es muy sencillo incorporar las correspondientes bibliotecas. Para ello, primero haremos una actualización de los repositorios con el siguiente comando:

    sudo equo update

Después realizamos la actualización del sistema para ponerlo al día, ya que Sabayon es una distribución *rolling-release* y, por ello, todas las instalaciones de la misma reciben la última versión disponible. Con este comando lo obtendremos:

    sudo equo upgrade

Y por último, basta con indicar el comando de instalación de Equo para incorporar OpenCV y sus dependencias.

    sudo equo install opencv

Tras la instalación, podrás encontrar los headers de opencv en ***/usr/include/opencv*** y ***/usr/include/opencv2***, y la bibliotecas de la misma las encontrarás en ***/usr/lib/***.

###La forma tradicional, según OpenCV.

También podemos optar por realizar la instalación mediante la forma común para todas las distros y recomendada por la propia documentación de openCV. Para ello, necesitamos:


---
authors: ['Aglezabad']
date: 2014-03-07 23:10:00+01:00
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

* gcc
* cmake
* git (si queremos la versión de desarrollo de OpenCV)
* pkgconfig
* python
* libav
* gtk+ (libgtk)

A nivel opcional, podemos recurrir a añadir:

* libdc1394
* libpng
* libjpeg
* libtiff
* libjasper

Todo ello lo podemos hacer con el siguiente comando en Equo:

    sudo equo install gcc make git dev-util/pkgconfig python libav gtk+ libdc1394 libpng jpeg tiff jasper

Tras ello podemos elegir entre [descargar a través de git](https://github.com/Itseez/opencv.git) la última versión u obtener la última estable [a través de Sourceforge](http://sourceforge.net/projects/opencvlibrary) en formato *tarball*.

Una vez que tengamos descomprimido el fichero tar o descargado de github el código, accedemos a la carpeta donde esté alojado y realizamos la generación de los ficheros Makefile con cmake.

    mkdir build
    cd build
    cmake -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..

Aquí le estamos indicando que compile e instale todo lo que haya disponible, incluyendo los códigos de ejemplo como facedetect. Si no ha habido ninguna complicación, bastaría con realizar:

    make
    sudo make install

Y con ello tendríamos las librerías de OpenCV instaladas. Su localización en el sistema de ficheros sería la siguiente: los headers estarían en ***/usr/local/include/opencv*** y ***/usr/local/include/opencv2***, y las bibliotecas estarían en ***/usr/local/lib***.

Espero que este artículo sirva de ejemplo en que no existen diferencias entre distintas distribuciones. Solo hay que buscar bien las dependencias, que es donde reside el nivel de "dificultad" de cada distro.

>Fuentes: [(1)](http://www.ubuntu-mobile.net/instalar-opencv-en-ubuntu/), [(2)](http://docs.opencv.org/doc/tutorials/introduction/linux_install/linux_install.html)

---
authors: ['Ferthedems']
date: 2013-03-06 14:13:17+00:00
layout: post
slug: tvenlinux-ver-la-tv-por-internet-sin-necesidad-de-un-sintonizador
title: TVenLinux, ver la TV por internet sin necesidad de un sintonizador
thumbnail: ['/attachments/2013/03/busi_tv.png','Tv en Linux']
categories: ['linux']
tags: ['herramientas', 'televisión', 'tv']
---

TVenLinux es un _script Bash_ para ver/grabar los algunos de los canales de televisión de habla hispana más conocidos, cubriendo un número muy elevado de países: _España_, _Perú_, _Chile_, _Cuba_, _Venezuela_, _Bolivia_, _Argentina_, _Colombia_, _Paraguay_ y _Ecuador_. También podremos encontrar algunos canales en otros idiomas. Utiliza un conjunto de aplicaciones que será necesario instalar previamente, aunque en la web se indican los pasos para instalar estas dependencias en las distintas distros:
  * Mplayer
  * Curl
  * Rtmpdump
  * Zenity (entornos GTK) o Kdialog (entornos KDE)

A continuación vamos a ver los pasos para instalar. Resumidamente, tendremos que instalar unas dependencias necesarias, descargarnos el script y ejecutarlo. En general, los usuarios de Ubuntu, Debian y derivados, deberán abrir un terminal e instalar las dependencias mediante el siguiente comando:
   
    sudo apt-get install mplayer rtmpdump curl

Los usuarios de Arch-Linux están de enhorabuena, ya que pueden instalar la aplicación desde el AUR. La secuencia de comandos será la siguiente:
    
    sudo pacman -S mplayer rtmpdump curl
    yaourt -S tvenlinux-desktop

Y con ello podrán ejecutarlo directamente.

Los usuarios de otras distros deberán además [descargar el script](http://www.tvenlinux.com/TVenLinux.sh), darle permisos de ejecución _(con el comando **chmod** o en muchas distros mediante **botón derecho > propiedades > permisos**, marcando que nos permita ejecutar el archivo como un programa)_. Luego, lo ejecutamos:

<img alt="Ejecutar script TV" src="/img/placeholder.gif" data-original="/attachments/2013/03/Captura-de-pantalla-de-2013-03-05-202639.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

<img alt="Tv en Linux" src="/img/placeholder.gif" data-original="/attachments/2013/03/Captura-de-pantalla-de-2013-03-05-202658.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

<img alt="MPlayer TV" src="/img/placeholder.gif" data-original="/attachments/2013/04/Captura-de-pantalla-de-2013-03-05-202905.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

Os recordamos que también podéis poneros en contacto con el autor o si os ha gustado el script hacerle alguna donación, para lo cual podéis [visitar la página del autor](http://www.tvenlinux.com/).

## Actualización

El usuario _rama_ ha compartido un paquete .deb para sistemas basados en Debian que controla las dependencias de la aplicación y la instala creando un icono de la misma en el menú del sistema. En este caso, **utiliza _VLC_ en lugar de _mPlayer_**.

<a class="btn btn-primary" href="https://mega.co.nz/#!aMt0hKwY!PQRwl1xsC14v2K-D4kpXKgfHoAElBJi7clr9ibV0o_c">
  Descarga paquete .deb
</a>

---
authors: ['Ferthedems']
date: 2013-03-25 11:30:50+00:00
layout: post
slug: guia-de-instalacion-de-arch-linux-el-sistema-base
title: 'Guía de instalación de Arch Linux: el sistema base'
thumbnail: ['/attachments/2013/03/Arch-LOGO.png', 'Logo de Arch']
categories: ['arch', 'tutoriales']
tags: ['instalación']
---

Durante los últimos meses del 2012, Arch Linux tuvo una etapa de intensos cambios que hicieron que el modo de instalación tradicional variase. Desde entonces no tuve tiempo para reinstalar la _distro_ ni encontré guías con las que consiguiese hacer todos los pasos con éxito, ya que muchos aspectos habían cambiado en el proceso de instalación. En este caso vamos a ver cómo instalar el sistema base, de acuerdo a los nuevos pasos, necesarios a fecha de hoy.

En mi experiencia personal, recomiendo paciencia, ya que normalmente es difícil que nos salga todo a la primera, y debemos prestar especial atención a los comandos que escribamos para evitar equivocaciones.

<div class="alert alert-warning">
**Aviso:** el proceso de instalación requiere ciertos conocimientos previos, algunos obligatorios como saber arrancar un CD o un Pendrive al inicio, y otros aconsejables como un cierto manejo de la línea de comandos en Linux.
</div>

### Obtención del medio de Instalación

En primer lugar tendremos que descargarnos la última imagen de Arch Linux [desde la sección de descargas de la web](https://www.archlinux.org/download/). Ahora deberemos grabarla en un CD/DVD o bien en un _pendrive_.

#### Crear un pendrive de instalación de Arch Linux desde Linux

En primer lugar, deberemos conocer el nombre que se le asigna a la unidad en _/dev/_, que será algo por el estilo de /dev/sd**n**, donde n será un número de unidad. Un truco personal _(para evitar confusiones **fatales**)_ es ejecutar un comando dos veces, antes y después de enchufar el pendrive en Linux:
    
    ls -1 /dev/ | grep sd

Y obtendremos una lista de las unidades disponibles antes y después, como por ejemplo en mi caso:

<img alt="El comando ejecutado antes." src="/img/placeholder.gif" data-original="/attachments/2013/03/instantánea2.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

<img alt="El comando, ejecutado después" src="/img/placeholder.gif" data-original="/attachments/2013/03/instantánea1.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

Con esto me he asegurado de que el _pendrive_ se llama **sdb**. Aunque en esta ocasión era obvio, si tuviéramos varios periféricos y discos conectados al ordenador desde el que estamos trabajando, podríamos equivocarnos. Ahora, desde una terminal, generaremos el pendrive instalador:
    
    # dd if=/ruta/de/imagen/archlinux.iso of=/dev/sdb

<div class="alert alert-danger">
¡Cuidado! este comando sobreescribirá la unidad que coloquemos como parámetro de salida (of), y ésta perderá sus datos.
</div>
A continuación reiniciaremos el equipo y arrancaremos desde el CD/DVD/USB.

#### Instalación en disco

Al arrancar, elegiremos una opción: Arch de 64 bits (x86_64) o Arch de 32 bits (i686). Dependiendo de qué variante del sistema queramos instalar, deberemos escoger una u otra.

<img alt="Boot" src="/img/placeholder.gif" data-original="/attachments/2013/03/Arch_boot.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

A continuación se nos mostrará un _prompt_. Deberemos cargar el **teclado español**:
    
    # loadkeys es

##### Particionado

Utilizaremos la utilidad que nos proporciona la Arch, aunque se podría hacer perfectamente con **gParted** antes de comenzar el proceso de instalación, y pasar directamente al siguiente punto. _Para hacerlo manualmente, ejecutaremos la utilidad, llamada cfdisk:_
    
    # cfdisk

<img alt="Cfdisk" src="/img/placeholder.gif" data-original="/attachments/2013/03/Arch_cfdisk_1.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

Y haremos un _particionado clásico_ para Linux:

  * Una partición para _/boot_. Con 200-500 MB será suficiente. Marcaremos como **tipo Linux (83)** y la pondremos como partición **Bootable** (es decir, que pueda ejecutarse el sistema desde ella).

  * Una partición para /. Contendrá el sistema y las aplicaciones, por lo que el tamaño debería situarse entre los 10 y los 50 GB dependiendo de vuestro disco. Marcaremos **tipo Linux (83)**.

  * Una partición para /home. La clave de tener el _/home_ separado reside en que ante un desastre, nuestros documentos y configuraciones estarán a salvo, e incluso podrán restaurarse en una nueva instalación. A ésta unidad se le suele dar la mayor parte del espacio. Marcaremos **tipo Linux (83)**.

  * Una partición para la memoria de intercambio. Marcaremos **tipo Linux/Swap (82)**. El tamaño deberá ser el doble de la RAM para equipos con menos de 1GB, lo mismo que la RAM para equipos con 1-2GB y 1GB o 2GB para ordenadores con 4GB de RAM o más.

<img alt="Cfdisk" src="/img/placeholder.gif" data-original="/attachments/2013/03/Arch_cfdisk_2.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

De esta manera, en este caso tendremos el siguiente esquema de particiones:
  1. _/dev/sda**1**_ para _/boot_
  2. _/dev/sda**2**_ para _/_
  3. _/dev/sda**3**_ para _/home_
  4. _/dev/sda**4**_ para la memoria de intercambio (**swap**).

Una vez realizado este paso, formatearemos las particiones:
    
    # mkfs.ext2 /dev/sda1
    # mkfs.ext4 /dev/sda2
    # mkfs.ext4 /dev/sda3
    # mkswap /dev/sda4

##### Creación de los puntos de montaje

Activaremos la memoria de intercambio o **swap**:
   
    # swapon /dev/sda4

Definiremos el punto de montaje para **/**:
    
    # mount /dev/sda2 /mnt

Crearemos las carpetas correspondientes a **/boot** y **/home **en **/**:
    
    # mkdir /mnt/home
    # mkdir /mnt/boot

Y definiremos los puntos de montaje para sendas particiones:
    
    # mount /dev/sda3 /mnt/home
    # mount /dev/sda1 /mnt/boot

##### Conexión a internet

Se recomienda realizar la instalación conectándonos a internet por cable, ya que no tendremos que configurar nada y tendremos más velocidad y seguridad en el proceso. No obstante, para aquellos que quieran utilizar la conexión vía wifi, se recomienda [visitar la wiki oficial](https://wiki.archlinux.org/index.php/Wireless_Setup_(Espa%C3%B1ol)).

##### Instalación del sistema

    # pacstrap /mnt base base-devel

A continuación crearemos más que conocido fstab, con el siguiente comando:
    
    # genfstab -U /mnt >> /mnt/etc/fstab

##### Configuración del sistema

Con el siguiente comando, entraremos al sistema (ya instalado) para configurarlo:
    
    # arch-chroot /mnt

A continuación le daremos a nuestra máquina un nombre. En mi caso será "**_archie_**".
    
    # echo archie > /etc/hostname

Estableceremos el idioma. Para ello editaremos el fichero /etc/locale.gen:
    
    # nano /etc/locale.gen

Y descomentaremos la línea (quitando la #) del español de España:
    
    es_ES.UTF-8 UTF-8

<img alt="Locale" src="/img/placeholder.gif" data-original="/attachments/2013/03/Arch_locale.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

A continuación ejecutaremos el siguiente comando:
    
    # locale-gen

Y seguidamente crearemos el archivo /etc/locale.conf, en el que deberemos incluir las siguientes líneas: [alert text="**Nota:** Este paso es **crucial**, y en otras guías no se incluyen las mismas sentencias. En mi caso, al ponerlo así es como he conseguido que los entornos gráficos se ejecuten **traducidos totalmente al castellano**, ya que a veces había partes de los mismos que aparecían en inglés."]
    
    LANG=es_ES.UTF-8
    LC_COLLATE=C
    LC_TIME=es_ES.UTF-8

Luego estableceremos el mapa del teclado de forma persistente _(el de loadkeys se borrará al reiniciar)_:
    
    # echo KEYMAP=es > /etc/vconsole.conf

También pondremos la hora, en nuestro caso, para España:
    
    # ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime

##### Usuarios y contraseñas

En primer lugar, estableceremos la contraseña para el usuario root:
    
    # passwd

Luego, crearemos nuestro usuario con grupo principal _users_:
    
    # useradd -m -g users -s /bin/bash nombreusuario
    # passwd nombreusuario

##### Habilitar la red en Systemd

Deberemos habilitar el servicio de red, que por alguna razón no se activa por defecto. Para ello, tendremos que ver el nombre de nuestra interfaz de red, que ya no tiene por qué llamarse eth0 o wlan0. Primero buscaremos el nombre de nuestra interfaz de red:
    
    # ls /sys/class/net

Y luego la activaremos:
    
    # systemctl enable dhcpcd@nombreinterfaz.service

Podemos ayudarnos del comando _ping_ para comprobar si hemos logrado conexión a internet.

<img alt="Net" src="/img/placeholder.gif" data-original="/attachments/2013/03/Arch_net.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block">

##### Instalando Grub
   
    # pacman -S grub-bios os-prober
    # grub-install --target=i386-pc --recheck /dev/sda

Para evitar el mensaje de que grub no encuentra el archivo de idioma, ejecutaremos:
    
    # mkdir -p /boot/grub/locale
    # cp usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/es.mo
    # export LANG=es_ES.UTF-8
    # mkinitcpio -p linux

Y generaremos el grub.cfg:
    
    # grub-mkconfig -o /boot/grub/grub.cfg

Ahora abandonaremos **chroot** con el comando _exit_:
    
    # exit

Y finalmente desmontaremos todas las unidades para luego reiniciar el sistema:
   
    # umount /mnt/{home,boot,}
    # reboot

Tras reiniciar, podremos extraer el medio de instalación y acceder al sistema básico, usando _nuestro usuario_ o bien el super-usuario _root_. Lo que nos quedaría sería instalar sudo y un entorno gráfico, lo cual será objeto de otro tutorial. No ha sido para tanto, ¿verdad? :-D.

>_Fuente_ ([1](http://gespadas.com/archlinux-instalacion-2012)) ([2](http://www.hdmagazine.org/)) ([3](https://wiki.archlinux.org/index.php/Network_Configuration)) ([4](https://wiki.archlinux.org/index.php/Installation_Guide)).

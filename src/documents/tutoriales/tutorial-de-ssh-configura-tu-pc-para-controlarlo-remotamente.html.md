---
authors: ['Ferthedems']
date: 2013-03-04 19:00:50+00:00
layout: post
slug: tutorial-de-ssh-configura-tu-pc-para-controlarlo-remotamente
title: 'Tutorial de SSH: configura tu PC para controlarlo remotamente (Parte 1)'
thumbnail: ['/attachments/2013/03/26openssh.png','Logo de openSSH']
categories: ['tutoriales']
tags: ['administración', 'bash', 'control remoto', 'servidores', 'ssh']
---

SSH son las siglas de _**S**ecure **Sh**ell_, un protocolo que nos permite de forma muy segura **controlar remotamente un ordenador**. Muchos habréis padecido el problema de estar en algún lugar y necesitar acceder al PC que tenemos en casa, ya sea para copiar un archivo, dejar descargando algo, o simplemente para configurarlo y/o utilizarlo sin precisar de una pantalla para ese ordenador.

Algunos conoceréis TeamViewer, una aplicación que nos permite controlar nuestro escritorio de forma remota con gran sencillez. La diferencia con SSH estriba en que éste último nos brinda el acceso a una consola de comandos _(nada de "escritorios gráficos")_, aunque como veremos podemos también ejecutar aplicaciones gráficas. Aunque bueno, siendo francos, es tal la potencia de la terminal de Linux que muy probablemente no necesitemos esa segunda opción.

_En éste manual veremos cómo configurar un servidor SSH a medida:_

* * *

_En este capítulo:_
	
  * Instalación.
  * Configuración.
  * Conexión y copia de ficheros.
    * Login normal.
    * Login seguro y sin contraseña.
    * Copiar ficheros a través de SSH.
  * Ejecución de aplicaciones gráficas a través de SSH.
  * Montar carpetas remotas con **SSHfs**.
  * Conectar desde un administrador de archivos: **Nautilus**.

_En el siguiente capítulo:_

  * Conectar por SSH desde Windows.
  * Ejecutar aplicaciones gráficas de Linux en Windows utilizando SSH.
  * Conectar por SSH desde Android.

* * *

### Instalación de SSH

Este paso es algo trivial, aunque de todos modos procederemos a explicarlo. Dependiendo de la distribución Linux que utilicemos deberemos teclear una secuencia de comandos diferente en nuestro terminal. En nuestro caso, instalaremos el servidor SSH en **Ubuntu **(y por tanto en _Linux Mint_, otros derivados y seguramente en _Debian_ los pasos de instalación serán iguales).

Primero instalaremos el servidor **en el ordenador al que nos vayamos a conectar**. Abrimos un terminal y tecleamos:
    
    sudo apt-get install openssh-server

En otras distribuciones el comando será distinto. Por ejemplo, [en _Arch Linux_](https://wiki.archlinux.org/index.php/Secure_Shell_(Espa%C3%B1ol)) sería:
    
    pacman -Syu openssh

A continuación tocaría instalar el cliente, lo cual se haría en el ordenador que fuese a conectar con el servidor. Normalmente solemos tenerlo instalado por defecto, así que **debéis saltaros este paso** a menos que al conectar recibáis un mensaje indicando que no tenemos el cliente de _ssh_ instalado.
    
    sudo apt-get install openssh-client

### Configuración de SSH

La configuración de SSH se realiza mediante la edición de un fichero de texto alojado en la ruta _etc/ssh/sshd_config_. Por tanto, abriremos con privilegios de administrados y utilizando un editor cualquiera (vim, nano, gedit...) realizaremos las configuraciones pertinentes.

<div class="alert alert-info">
Si alguna opción no aparece reflejada en el fichero deberemos incluirla nosotros manualmente.
</div>

En este caso utilizaremos un editor con interfaz gráfico (_Gedit [Ubuntu/Gnome] o kate [KDE]_), pero también se pueden utilizar otros como _nano_ o _vim_. Ejecutaremos desde una terminal:
    
    gksudo gedit /etc/ssh/sshd_config

Al igual que el protocolo FTP utiliza el puerto 21 por defecto, SSH utiliza el 22. Es recomendable por razones de seguridad sustituir este puerto por otro, ya que normalmente un atacante conocedor del protocolo intentará colarse por este puerto. También, en caso de querer acceder a vuestro ordenador desde una red distinta, es recomendable que dejéis abierto el puerto especificado en vuestro _router_ o utilicéis las opciones NAT.
    
    Port 8643

A continuación veremos la opción _Protocol_. Nosotros utilizamos **SSH 2**, pero no obstante antiguamente se utilizaba la versión 1, hasta que fueron descubiertas varias vulnerabilidades. Por seguridad y compatibilidad, es recomendable que esta opción esté en 2. Generalmente viene así por defecto.
    
    Protocol 2

En la sección **# Authentication** podremos configurar dos parámetros cruciales para nuestro SSH.

**LoginGraceTime** será el tiempo del que dispondremos para iniciar sesión en la máquina (ingresar la contraseña de usuario). Este valor debe ser bajo para impedir ataques que aprovechen ese lapso temporal. Un buen valor pueden ser 40 segundos, aunque depende de cuánto se tarde en teclear vuestra contraseña de usuario.
    
    LoginGraceTime 40

**PermitRootLogin** es la opción que permite iniciar sesión remotamente utilizando la cuenta de _root_. Es una práctica absolutamente desaconsejable, ya que toda máquina *nix o Linux tiene un usuario _root_, y a nuestro atacante ya no le haría falta obtener un nombre de usuario, sólo la contraseña. Nosotros pondremos el valor en **no** y _elevaremos privilegios_ en la máquina con **su** o **sudo **después de haber accedido a ella.
    
    PermitRootLogin no

A continuación restringiremos qué usuarios tendrán acceso a nuestro ordenador mediante SSH. Imaginemos que tenemos varias cuentas de usuario en el PC, una para cada uno de nuestros familiares más la nuestra más quizá la de algún amigo o usuario de nuestro servidor FTP. Nosotros sólo permitiremos el acceso a algunos usuarios, añadiendo el siguiente parámetro:
    
    AllowUsers univunix ejemplo@ip.del.usuario

De este modo sólo habrá dos usuarios autorizados a acceder por SSH. Uno será _univunix_ y el otro será _ejemplo_, quien sólo podrá entrar desde una determinada IP.

Ahora nos quedan dos parámetros que configuraremos dependiendo de nuestras necesidades. El primero será el número de intentos para iniciar sesión en caso de introducir la contraseña mal:
   
     MaxAuthTries 3

Y el segundo el número de conexiones simultáneas que soportará el servidor:
    
    MaxStartups 2

Cuando hayamos terminado de configurar SSH, lo que nos resta es empezar a utilizarlo. Deberemos reiniciar el demonio de SSH para que tome las nuevas opciones o bien reiniciar el ordenador que hará las funciones de servidor.

_Para reiniciar el demonio podemos usar los siguientes comandos:_
    
    sudo /etc/init.d/ssh restart

_O bien:_
 
    sudo service ssh restart

En general esto será válido en la mayoría de distros Linux, aunque las que hayan adoptado [Systemd](http://es.wikipedia.org/wiki/Systemd), como Arch Linux, [deberán añadir y reiniciar el demonio de otro modo](https://wiki.archlinux.org/index.php/Daemons).

### Conexión con SSH y principales modos de uso

En este apartado veremos las acciones más comunes que podemos realizar a través de la terminal.

#### Conexión por terminal

La sintaxis para conectarnos es:
    
    ssh [-p numero_de_puerto] usuario@ip.del.servidor

En el servidor de prueba que hemos configurado será así:
   
    ssh -p 8643 univunix@192.168.2.103

Tras presionar _intro_,  nos saldrá un mensaje diciéndonos que si estamos seguros de que la máquina a la que conectamos es la nuestra. Escribiremos _yes, _se nos pedirá la contraseña de usuario, y finalmente tendremos un _prompt_ de nuestro servidor. Con ello ya podremos controlar el ordenador remoto a nuestro antojo.

<img alt="Ejemplo de una sesión de bash" src="/img/placeholder.gif" data-original="/attachments/2013/03/Captura-de-pantalla-de-2013-02-17-162759.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block;">

<div class="alert alert-info">
No olvidéis que para acceder desde fuera de vuestra _red de área_ local tendréis que configurar el router. Para averiguar vuestra IP pública podéis utilizar algún servicio como **whatismyipaddress.com**. También podemos utilizar un dominio de **no-ip** en caso de tener IP dinámica.
</div>

#### Hacer _login_ sin contraseña en SSH

Deberemos generar en el cliente una _llave_ que luego pasaremos al servidor. Para ello, en el cliente teclearemos el siguiente comando:
    
    ssh-keygen -t rsa

Y presionaremos _enter_ hasta que el comando haga todas las acciones pertinentes. Con ello habremos alojado en nuestro _home_ la llave con la que vamos a iniciar sesión.

Ahora copiaremos la _llave_ al servidor para que pueda reconocernos:
    
<pre>ssh-copy-id '<strong>usuario</strong>@<strong>ip.del.servidor</strong> -p <strong>puerto</strong>'</pre>

Que en nuestro ejemplo sería:
    
    ssh-copy-id 'univunix@192.168.2.103 -p 8643'

Y listo. Ahora para arrancar la sesión teclearemos **_ssh -p 8643 univunix@192.168.2.103_** y deberíamos poder iniciar sesión sin que se nos pida la contraseña de usuario.

#### Copiar ficheros remotamente

Si queremos copiar archivos vía terminal, del servidor a cliente, será tan sencillo como utilizar el siguiente comando:
    
<pre>scp -P <strong>puerto</strong> <span style="color: #ff6600;"><em>ruta/archivo/servidor</em></span> <strong>usuario</strong>@<strong>ip.del.cliente</strong>:<span style="color: #0000ff;"><em>ruta/para/colocar/en/cliente </em></span></pre>

Seguramente os estéis preguntando qué sentido tiene poner la _IP del cliente_ en el comando anterior. He aquí la magia. Esa IP no tiene por qué ser la de nuestro cliente, puede ser la de **otro ordenador cualquiera al que queramos copiar el archivo**.

### Ejecución de aplicaciones gráficas a través de SSH

Deberemos utilizar la siguiente sintaxis:
    
<pre>ssh -X <em>[-p puerto]</em> usuario@servidor nombre_de_la_aplicación</pre>

<img alt="Ejemplo de una sesión de bash" src="/img/placeholder.gif" data-original="/attachments/2013/03/Captura-de-pantalla-de-2013-03-04-142206.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block;">

### Montar carpetas remotas con SSHfs

SSHfs es una aplicación cliente servidor que a _grosso modo_ monta un directorio del servidor en el cliente a través de SSH, con todos los beneficios en términos de seguridad que ello supone frente a otros métodos.

Deberemos tener activado el módulo del kernel _fuse_. Generalmente viene activado por defecto, aunque en caso de no ser así podéis poneros en contacto con nosotros y os intentaremos ayudar en el proceso.

En primer lugar, instalaremos en el cliente el paquete **SSHfs**. Para ello en el caso de las distros _Ubuntu / Debian_ utilizaremos el comando:
    
    sudo apt-get install sshfs

Y nos conectaremos con un comando que se rige según la siguiente sintaxis:
    
<pre>sshfs <em>usuario</em>@<em>ip.del.servidor</em>:<span style="color: #ff6600;"><em>/Directorio/que/montaremos/</em></span> <span style="color: #0000ff;"><em>/carpeta/del/cliente/donde/se/montará</em></span> -p <em>puerto</em> -o nonempty</pre>

<img alt="Ejemplo de una sesión de bash" src="/img/placeholder.gif" data-original="/attachments/2013/03/Captura-de-pantalla-de-2013-02-17-171736.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block;">

_¿Y qué hacer para que las carpetas remotas se monten automáticamente cuando arrancamos el ordenador cliente?_

Deberemos haber configurado el sistema para _hacer login sin contraseña _(visto anteriormente). Luego, editaremos el fichero **/etc/fstab** y añadiremos al final una línea con el siguiente contenido:
    
<pre>sshfs#<strong>usuario</strong>@<strong>ip.del.servidor</strong>:<span style="color: #ff6600;">/Directorio/que/montaremos/</span> <span style="color: #0000ff;">/carpeta/del/cliente/donde/se/montará</span> fuse port=<strong>puerto</strong>,defaults,nonempty,port=22,uid=<strong>usuario</strong>,gid=<strong>idGrupoUsuario</strong>,users,user,noauto 0 0</pre>

En sistemas como Ubuntu y sus derivados **usuario** e **idGrupoUsuario** tendrán el mismo valor, que sería el del usuario con el que vamos a iniciar sesión. Por ejemplo, para nuestro caso de prueba sería '_univunix_'.

### Conectar por SSH desde un administrador de archivos: Nautilus

Esta opción es muy cómoda a la hora de realizar el acceso a nuestro servidor con la finalidad de **acceder a nuestros archivos** y/o manipularlos. La conexión es tan sencilla como si de un FTP se tratase.

<div class="alert alert-info">
Como existen numerosos navegadores de archivos, nosotros realizaremos el acceso desde uno de los más conocidos en el mundo Linux. No obstante otros navegadores como _Thunnar_ (xfce), _Dolphin_ (KDE), y un largo etcétera permiten conectar a un servidor SSH de la misma manera o similar.
</div>

En nautilus, primero tendremos que activar la barra de búsqueda en modo tradicional pulsando _CTRL+L_. Luego, estableceremos la conexión tecleando en esta última la dirección de acuerdo a la siguiente nomenclatura:
    
<pre>sftp://<strong>usuario</strong>@<strong>servidor</strong>:<strong>puerto</strong></pre>

<img alt="Ejemplo de una sesión de bash" src="/img/placeholder.gif" data-original="/attachments/2013/03/Captura-de-pantalla-de-2013-02-17-164411.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block;">

<img alt="Ejemplo de una sesión de bash" src="/img/placeholder.gif" data-original="/attachments/2013/03/Captura-de-pantalla-de-2013-02-17-164437.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block;">

<img alt="Ejemplo de una sesión de bash" src="/img/placeholder.gif" data-original="/attachments/2013/03/Captura-de-pantalla-de-2013-02-17-164554.png" class="img-responsive img-rounded lazy" style="margin: 0 auto; display: block;">

En el próximo capítulo veremos las alternativas de a la hora de **establecer conexión desde otros sistemas**.

>Fuente [(1)](http://tuxpepino.wordpress.com/2007/05/11/ssh-el-dios-de-la-administracion-remota/) [(2)](http://www.uv.es/~sto/articulos/BEI-2003-01/ssh_np.html) [(3)](http://laventanamuerta.net/usa-nautilus-como-cliente-ftp-sftp-y-ssh/) [(4)](http://www.linuxparatodos.net/portal/article.php?story=SSHFS) [(5)](http://albertomoralescruz.blogspot.com.es/2011/05/montando-unidades-mediante-sshfs-en-el.html)

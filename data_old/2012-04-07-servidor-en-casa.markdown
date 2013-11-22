---
author: Aglezabad
comments: true
date: 2012-04-07 14:40:47+00:00
layout: post
slug: servidor-en-casa
title: Monta un servidor en casa con Linux y hardware viejo.
wordpress_id: 79
categories:
- Tutoriales
tags:
- DNS
- Hardware
- Home server
- Linux
- Software libre
---

[caption id="attachment_80" align="alignleft" width="300"][![Linux Home Server](http://www.interusers.eu/wp-content/uploads/2012/03/P7110092th-e1334569522960-300x269.jpg)](http://www.interusers.eu/wp-content/uploads/2012/04/P7110092.JPG) Interior de un Servidor GNU/Linux para el hogar, concretamente, el mío.[/caption]


## I. Introducción.


Bienvenido a esta guía. En este texto, explicaré cómo aprovechar el hardware viejo procedente de equipos que ya no usemos para darles una nueva forma de uso, en lugar de guardar polvo o desecharlos.

Con la instalación de una distribución linux dedicada a servidores, las cuales carecen de entorno de escritorio, podemos configurar nuestra máquina para ser un perfecto "home server" para guardar nuestros archivos a modo de backup o como emisor multimedia. También se incorporará un proxy-caché y un servidor DNS para mejorar nuestra calidad de acceso a internet. Y por último, le podemos incorporar un cliente Bittorrent para nuestras descargas, todo ello usando software libre y hardware medianamente obsoleto.

<!-- more -->

Para un sistema en casa en el que tengamos 2 o 3 ordenadores conectados, nos basta con un procesador de 800 Mhz hasta 1.4 Ghz, suficiente para todas las tareas descritas. Siempre se puede poner procesadores de frecuencias mayores y aprovechar el underclock para mejorar la temperatura del mismo.
Yo hice uno igual en su momento, el cual me sirvió de gran utilidad hasta preparar un nuevo servidor, el cual uso para albergar esta web, interusers.eu. Procedemos a la lista de recomendaciones del hardware, en la siguiente página.




## II. Hardware.


En este apartado se indica los requisitos para montar un home server. Los componentes a usar serán componentes en desuso para nuestras tareas habituales, que, debido a la existencia del "e-trash" (basura electrónica) y su falta de reciclado, evitaremos desechar componentes funcionales aun siendo antiguos.

¿Qué necesitamos? Obviamente, necesitaremos los componentes básicos:



	
  * **Procesador y placa base:** El procesador que necesitemos no requiere ser de gran potencia. Procesadores de 1Ghz o superiores son perfectos para un home server con poco usuarios. Con 1 - 1.2 Ghz nos sobra en potencia y es recomendable también para un consumo menor y que no repercuta en nuestra factura de luz. Yo, en mi home server, estoy usando un procesador Athlon XP 3200, que funciona a 2.2Ghz. Realizando el conocido "underclock", reducimos el multiplicador hasta dichos valores, ahorrando energía, reduciendo temperaturas y facilitar la refrigeración del equipo. La placa base puede servir cualquiera, pero siempre es mejor que pueda tener un par de puertos SATA de 1.5 Gbps como mínimo. Si no, nos conformaremos con la interfaz IDE o compraremos un controlador SATA (eso depende del gasto que quieras hacer para reconstruirlo a tu necesidad) o USB, si quieres un gasto menor.




	
  * **Memoria RAM:** La cantidad de memoria debe ser equilibrada a nuestras necesidades, aunque siempre cuanto más, mejor. Con 512 MB de RAM podemos montar un pequeño servidor en condiciones que soporte bastante carga si optimizamos en sus utilidades. Con 256 MB de RAM también es posible, pero no tendrá el mismo rendimiento. En mi caso, dispongo de 1 GB de RAM de la cual uso 512 MB al implementar un proxy-caché de gran capacidad.




	
  * **Fuente de alimentación:** Yo, para ahorrar recursos al disponer de una fuente sin usar, he puesto una genérica; si prefieres comprar alguna fuente de mejor calidad, siempre será mejor ante posible problemas eléctricos.




	
  * **Caja: **Una pequeña caja o gabinete de aluminio nos sobra para este caso, ya que se realizarán pocas ampliaciones y porque no usaremos tarjeta gráfica en su uso normal. Recomiendo que tenga una ventilación correcta como mínimo. En esto, prefiero escatimar en recursos y dinero, porque siempre puedes hacerla tú mismo.




	
  * **Tarjeta gráfica:** La más básica que tengas. Si tienes una PCI del 95 más o menos, viene perfecta, ya que sólo la usamos durante la instalación del sistema operativo y para comprobar errores si por ssh no logramos conectar. También con tener una gráfica que valga para esa placa base es suficiente.




	
  * **Disco duro:** Aquí entra el volumen de datos a compartir o guardar. Si la placa base dispone de puertos SATA, es preferible comprar discos duros SATA II a 3Gbps, ya que estos son compatibles con los puertos de 1.5 Gbps en la mayoría de casos. En caso contrario, podemos tirar de discos IDE (IDE es estándar y debe estar disponible en tiendas) o USB, aunque no será ni la máxima capacidad en los primeros ni la máxima velocidad en los segundos.


En la página siguiente, haré una breve explicación acerca de la instalación de GNU/Linux Ubuntu Server.




## III. Instalación de Ubuntu Server.


En esta sección, se explicará de forma sencilla el proceso de instalación de Linux Ubuntu Server. Quienes hayan hecho instalaciones de Windows XP o similares, les será muy sencillo.

Lo primero: descargamos la ISO desde [www.ubuntu.com,](http://www.ubuntu.com,) elegimos Server y nuestra versión. La de 32 bit es perfecta para la mayoría de PCs, mientras que la versión de 64 bits sirve para los procesadores compatibles (revísalo antes de comenzar). Después, en la BIOS, debemos asignar como primera preferencia de arranque al dispositivo CD-DVD para comenzar con la instalación.
![](http://www.interusers.eu/wp-content/uploads/2012/04/iubuntus.png)
Le damos a la primera opción, y entramos en la instalación. Pedirá elegir el país correspondiente y el idioma de sistema, así como el idioma del teclado.
![](http://www.interusers.eu/wp-content/uploads/2012/04/selecregion.png)

Empezará a cargar todo el instalador y procederá a configurar la red con DHCP. Yo, sinceramente, prefiero tener una IP fija asignada a mi servidor en la red local, ya que es más sencillo buscar la dirección adecuada en lugar de recurrir al DHCP para ver donde está. Si quieres dejarlo con DHCP, no canceles el proceso; en caso contrario, cancela el proceso pulsando "Enter". En este caso, cancelo el proceso y selecciono la opción indicada en la imagen.
![](http://www.interusers.eu/wp-content/uploads/2012/04/ered.png)
Introducimos lo que solicita en orden: IP a asignar a la máquina (comprueba primero la IP de tu red), máscara (255.255.255.0 es la más común) y puerta de enlace (la IP de tu router, que debes conocer previamente). Y ya tendremos el servidor enganchado a la red local de una forma u otra.
![](http://www.interusers.eu/wp-content/uploads/2012/04/ipl.png)
Posteriormente asignamos un nombre a la máquina, puede ser el que queráis.
Y procedemos a particionar el disco, el cual lo vamos a realizar por el método manual, ya que podremos manejar todo de forma más controlada. El método guiado es la manera más rápida, pero puede que no te interese los tamaños que ponga a las particiones. Eso ya es decisión de cada uno de hacerlo automáticamente o no.
![](http://www.interusers.eu/wp-content/uploads/2012/04/part1.png)
Partiremos el disco duro en 3 partes: /boot, / (raíz) y /home (se selecciona los montajes al crear la partición), formateadas en ext4 y con un tamaño tal: 256MB para /boot, entre 3 y 40GB para la raíz (si asignamos 40 tendremos espacio de sobra y con creces, así que debéis asignar el tamaño en proporción al espacio libre de disco), y para /home asignamos el 75% del espacio vacío restante en lugar del 100% del espacio, para dejar áreas sin usar (luego puede redimensionar /home y hacerla más grande si fuese necesario).
![](http://www.interusers.eu/wp-content/uploads/2012/04/part2.png)
Y aceptamos el proceso. Os saltará un aviso acerca de la ausencia de la partición swap, le indicamos que no queréis volver a la edición de partición. Y ahora preguntarán el porqué de no poner algo en un sistema cuyo instalador avisa de su inexistencia.  La partrición swap es concebida a modo de memoria virtual, guardando en disco parte de los programas cuando no están en uso y no haya memoria RAM libre suficiente para nuevos programas. No se pone en este caso debido a que nuestro "home server" necesita tener una respuesta rápida y el proceso de mandar los programas a disco hace que la respuesta sea mucho más lenta de lo normal. Por contra, según la información indicada en [www.danielclemente.com](http://www.danielclemente.com/amarok/resulta.html) (Sección "Problemas con RAM y CGIs") , puede que en caso de saturación, sin memoria swap, el kernel cierre los programas de mayor consumo y uno de esos programas sea algo vital de nuestro "home-server".

Y comenzará la instalación de Ubuntu server, esperamos pacientemente el proceso y finalmente, solicitará un usuario con acceso a root (sudo) y una contraseña. Solicitará también qué módulos queremos instalar. Seleccionaremos en todo caso, pulsando "Espacio", las opciones "DNS" y "Server SSH".
Terminará de instalar todos los componentes y finalizará la instalación.

Con ello, apagamos el PC y desconectamos teclado y monitor, porque ya no son necesarios. Como extra, para ahorrar energía, sería conveniente desconectar la tarjeta gráfica en caso de ser dedicada (situada en una bahía PCI, AGP, o PCI-E).

Y en la próxima y última página, configuraremos el equipo para convertirse en un "home server" efectivo y multifuncional que se encargará de tareas comunes entre computadoras, por ejemplo, P2P, proxy-caché entre otras. Concretamente, se explicará estos dos primeros. Ya, en el resto, tendrán que tener las ganas de buscar la información, la cual abunda.




## IV. Instalando las funciones del servidor.


Después de la instalación del sistema operativo, toca realizar la instalación de los programas que más os convengan tales como clientes torrent, proxys y DNS entre otros. Si durante la instalación habéis añadido los paquetes DNS Server y OpenSSH-server (salen en un apartado de la instalación), procedemos pues a instalar los módulos que queden. DNS server no es obligatorio mientras que SSH es vital para realizar nuestras tareas y transferencias de archvios a distancia en un túnel cifrado. Primero, nos conectamos al servidor por SSH. En ubuntu, simplemente introduciendo en el terminal lo siguiente:

    
    ssh "IP del servidor"


Pedirá el usuario y contraseña del servidor, que será el asignado durante la instalación de Ubuntu server. En caso de ser usuario de Windows, nos descargamos la siguiente aplicación: PuTTY. Para descargarlo, [**AQUÍ**](http://www.chiark.greenend.org.uk/%7Esgtatham/putty/download.html) (elegimos putty.exe). Lo ejecutamos e indicamos la opción SSH, "Port:" 22 y la IP del servidor.

Después del proceso, nos saldrá lo siguiente:

    
    //Estado de la máquina.
    "usuario"@"hostservidor":~$




### A. Instalando un cliente P2P torrent


Y empezamos con el primer paso: Instalar un cliente torrent con capacidad de administrarse remotamente y sea muy estable. Normalmente el conocido Transmission realiza a la perfección esta función. Siempre lo encontramos en cada nueva versión de Ubuntu, teniendo sus seguidores.

Como manejamos un servidor y, por ello, no existe la interfaz gráfica, tocará instalar dicho programa sin interfaz, sólo instalando su "daemon".

    
    sudo apt-get install transmission-daemon


Se instalará correctamente pero no es suficiente, tendremos que asignar permisos y configurar el cliente antes de poder activarlo y compartir.
Abriremos con el editor nano el archivo de configuración settings.json situado en "/var/lib/transmission-daemon/info/settings.json". Recordad, añadir sudo para modificar archivos de programas:

    
    sudo nano /var/lib/transmission-daemon/info/settings.json


Después de ejecutar nos saldrá un archivo un poco extenso para quienes no hayan tocado nunca el terminal o PuTTY (en Windows). Yo os enseño el fichero con lo necesario a modificar, no es un biblia de configuración ni la opción perfecta, pero será suficiente para acceder a la interfaz y desde ahí activar la opciones oportunas:

    
    {
    "alt-speed-down": 500,
    "alt-speed-enabled": true,
    "alt-speed-time-begin": 480,
    "alt-speed-time-day": 127,
    "alt-speed-time-enabled": true,
    "alt-speed-time-end": 0,
    "alt-speed-up": 10,
    "bind-address-ipv4": "0.0.0.0",
    "bind-address-ipv6": "::",
    "blocklist-enabled": false,
    "dht-enabled": true,
    "download-dir": "/home/"usuario"/torrent", //Por ejemplo, poned la que mejor os convenga, siempre mejor en la carpeta home.
    "download-limit": 1000,
    "download-limit-enabled": 0,
    "encryption": 2,
    "incomplete-dir": "/var/lib/transmission-daemon/info/Incomplete",
    "incomplete-dir-enabled": false,
    "lazy-bitfield-enabled": true,
    "max-peers-global": 200,
    "message-level": 2,
    "open-file-limit": 32,
    "peer-limit-global": 240,
    "peer-limit-per-torrent": 60,
    "peer-port": 20683, //Puertos que queráis.
    "peer-port-random-high": 20500, //Puertos que queráis.
    "peer-port-random-low": 20599, //Puertos que queráis.
    "peer-port-random-on-start": true, //Cada vez que incias el cliente, se conecta a través de un puerto distinto.
    "peer-socket-tos": 0,
    "pex-enabled": true,
    "port-forwarding-enabled": true, //Te ahorras abrir los puertos en el router.
    "preallocation": 1,
    "proxy": "", //Sólo si tienes un proxy intermedio en internet.
    "proxy-auth-enabled": false,
    "proxy-auth-password": "",
    "proxy-auth-username": "",
    "proxy-enabled": false,
    "proxy-port": 80,
    "proxy-type": 0, //Fin proxy
    "ratio-limit": 0.2500,
    "ratio-limit-enabled": true,
    "rename-partial-files": true,
    "rpc-authentication-required": true,
    "rpc-bind-address": "0.0.0.0",
    "rpc-enabled": true,
    "rpc-password": "password", //Introduce una contraseña.
    "rpc-port": 9091,
    "rpc-username": "transmission",
    "rpc-whitelist": "127.0.0.1,*.*.*.*", //Poner la IP de tu PC en los asteriscos.
    "rpc-whitelist-enabled": true,
    "speed-limit-down": 1500,
    "speed-limit-down-enabled": true,
    "speed-limit-up": 50,
    "speed-limit-up-enabled": true,
    "umask": 2,
    "upload-slots-per-torrent": 4,
    "watch-dir": "/home/"usuario"/torrent", //Cambiar por carpeta descargas.
    "watch-dir-enabled": true
    }


Reiniciamos el servicio correspondiente de la siguiente forma:

    
    sudo service transmission-daemon reload



    
    sudo service transmission-daemon restart




### B. Instalación de un proxy-caché.


Para instalar squid, el programa encargado de hacer el proxy, ejecutamos apt-get:

    
    sudo apt-get install squid3


Accedemos a la configuración del proxy cuando finalice la instalación del mismo:

    
    sudo nano /etc/squid3/squid.conf


Veréis todas las anotaciones de configuración, sus opciones y extras para modificar el proxy a nuestro gusto, pero es costoso cambiar la configuración con toda las anotaciones por medio. Para ello, borraremos el fichero, guardando previamente una copia.

    
    sudo cp /etc/squid3/squid.conf /etc/squid3/squid.conf.bak
    sudo rm /etc/squid3/squid.conf


Y volvemos a llamar a nano para escribir una configuración mínima pero funcional del proxy. Como es normal, tenemos que asignar un puerto por el cual conectaremos al proxy, un rango de direcciones a permitir o denegar el acceso y la configuración de las cachés de memoria y disco.
Para facilitar el proceso, aquí una plantilla:

    
    http_port "puerto a conectar"
    acl lan src "rango ip de tu red local"
    http_access allow lan //Permite a tu red local acceder al proxy.
    visible_hostname "nombre equipo" //(opcional) Muestra el nombre puesto en caso de error, para identificarlo.
    cache_mgr "nombre user" //(opcional) Indica el nombre del responsable del sistema en caso de error para contactar con él. Sólo sirve para entornos de empresa o redes de cibercafé.
    cache_mem 480 MB // El tamaño de memoria dedicada a caché. Su tamaño debe ser, como mucho, la cuarta parte de la RAM total.
    cache_dir ufs "lugar de la carpeta caché" "tamaño" 16 256 //Tamaño y lugar de la caché en disco. Lo primero de la sentenicia es el sistema de ficheros, por defecto es ufs.


Si queréis configurarlo a un gusto propio, es recomendable mirar la página del proyecto, donde está toda la información necesaria para configurar permisos, horas de uso y bloqueo de puertos.

http://www.squid-cache.org/

Planeaba continuar esta guía, añadiendo toda novedad que le ponía, pero en realidad estos eran los usos del home server, aparte de ser los programas más problemáticos que puede haber en mi caso y también por tener el nuevo servidor, el que aloja esta página.

Espero que puedan aprovechar sus viejos ordenadores. Así evitaremos tirarlos antes de probar si soportan alguno de nuestros cometidos con una distro de GNU/Linux (o BSD, si me animo).


Este tutorial está registrado bajo la licencia creative commons.
[![Licencia de Creative Commons](http://www.interusers.eu/wp-content/uploads/2012/04/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/3.0/)
Tutorial Interusers: Monta un servidor en casa con Linux y hardware viejo. (antes Aprovecha hardware viejo y móntate un "home server".) by [A.Gonzalez (Aglezabad)](http://www.interusers.eu/2012/servidor-en-casa/) is licensed under a [Creative Commons Reconocimiento-NoComercial-CompartirIgual 3.0 Unported License](http://creativecommons.org/licenses/by-nc-sa/3.0/).




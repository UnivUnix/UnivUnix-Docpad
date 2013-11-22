---
author: Aglezabad
comments: true
date: 2012-05-23 13:20:20+00:00
layout: post
slug: reducir-tiempo-acceso-web
title: Cómo reducir el tiempo de acceso a una página web.
wordpress_id: 201
categories:
- Tutoriales
tags:
- DNS
- ISP
- latencia
- Linux
- Redes
- Software
- Windows
---

Últimamente, aunque tengamos una mayor velocidad de descarga (mayor ancho de banda), notáis que el tiempo de carga de las páginas web es lento y tardamos mucho tiempo en pequeñas y simples tareas. Eso puede ser debido a varios factores:



	
  * Tu operadora restringe el tráfico hacia esa web.

	
  * La web esté saturada de visitantes.

	
  * Los servidores DNS responden con lentitud.


De las tres situaciones, solamente podremos solucionar la tercera, mientras que la primera no es posible solucionar y la segunda la tendría que solventar el administrador de esa web. Por ello, voy a explicar cómo podemos mejorar los tiempos de respuesta en el acceso a una web.<!-- more --> Para ello, explicaré qué son los servidores DNS:

Los servidores DNS son centros de computación que poseen los ISP (Telefónica, Orange, Fibertel...) y otras entidades de la red (Google, RedIris...) cuya labor es traducir las solicitudes de los usuarios, quienes ponen el dominio (nombre) de la página web (ej: google.es), y lo traducen por sus correspondientes direcciones IP. Esto facilita mucho la navegación al usuario medio, porque es más sencillo memorizar varios nombres en lugar de varias direcciones IP.

Los posibles problemas que puede haber en un servidor DNS son: la latencia posible entre tu equipo y su servidor, que envíe páginas de publicidad en lugar de indicar que la página no existe, o la posibilidad de ser un servidor dependiente de otro, aumentando así la espera.

Hay formas de solucionar en parte estas complicaciones pero la descrita aquí es la más sencilla: cambiaremos de servidor DNS. Para ello, usaremos el programa DNS Benchmark que fue mencionado en este foro. Dicho programa es gratuito y disponible solamente para los sistemas Windows, pero con Wine también se puede ejecutar en Linux y Mac. Si buscan un programa multiplataforma alternativo y libre, disponen de Namebench. Abajo tenéis las direcciones:

	
  * DNS Benchmark: [Acceso a la web del programa.](http://www.grc.com/dns/benchmark.htm)



	
  * Namebench: [Acceso a la web del programa.](http://code.google.com/p/namebench/)




### I. Uso de DNS Benchmark.


Concretamente, vamos a explicar el modo de uso de DNS Benchmark, el cual nos descargamos y ejecutaremos (no hace falta instalarlo, es un simple archivo .exe). Nos mostrará el programa con sus secciones y elegimos "Nameservers", la sección donde se realiza las pruebas.


[![La interfaz de DNS benchmark, que tiene varias pestañas.](http://www.interusers.eu/wp-content/uploads/2012/05/tuto1.png)](http://www.interusers.eu/wp-content/uploads/2012/05/tuto1.png)




En dicha sección, vemos una larga lista de servidores comunes a todos los usuarios: Google, BT, Verizon, incluido las que otorga el DHCP del router o las que configuraste de forma manual. Como vemos en las siguientes capturas, dentro de "Nameservers" tenemos un botón llamado "Add/Remove servers" el cual nos permite editar esta lista común a una lista preparada para nuestra zona (No son los mismos DNS en España que en Bolivia o Argentina). Dentro de esa ventana, tendremos que selecciona "Build custom list".




[![Al seleccionar "Nameservers", vemos la lista de servidores.](http://www.interusers.eu/wp-content/uploads/2012/05/tuto2.png)](http://www.interusers.eu/wp-content/uploads/2012/05/tuto2.png)




[![Seleccionamos "Add/Remove servers".](http://www.interusers.eu/wp-content/uploads/2012/05/tuto3.png)](http://www.interusers.eu/wp-content/uploads/2012/05/tuto3.png)
Comenzará un proceso de media hora de duración, en la cual el programa tomará el tiempo que tarda en responder a direcciones de páginas web en una lista de 4.000 servidores DNS aproximadamente. En ese momento, es importante no usar la conexión, ya que no sería fiable la lista.


Después de esa tarea, volveremos a "Nameservers", y hacemos click en Run Benchmark.


[![Al pulsar "Run benchmark", el programa hará prueba de las DNS.](http://www.interusers.eu/wp-content/uploads/2012/05/tuto5.png)](http://www.interusers.eu/wp-content/uploads/2012/05/tuto5.png)




Esperamos unos minutos,y nos saldrá una lista ordenada de servidores. Los primeros son los más rápidos y fiables, por ello, siguiendo lo siguiente, los aplicamos como nuestras DNS. En la página siguiente, si lo necesitases, tienes una breve explicación de cómo aplicar las nuevas DNS tanto en Windows como en GNU/Linux.





### II. Aplicación de las DNS al sistema operativo.




#### Windows 7, Vista. (XP en panel de control, conexiones)


Para aplicar nuestras nuevas DNS, en Windows 7, nos vamos a Panel de Control, Redes, Centro de redes.
En el lateral, hay un acceso que pone: "Cambiar configuración de adaptador". Hacemos click ahí y seleccionamos nuestro adaptador, después click derecho y selecionamos "Propiedades":


[![Adaptadores red / propiedades](http://www.interusers.eu/wp-content/uploads/2012/05/tutob1.png)](http://www.interusers.eu/wp-content/uploads/2012/05/tutob1.png)




Se nos abre una ventana, en la cual seleccionamos "Protocolo IPv4" y le damos a "Propiedades":




[![Propiedades / Protocolo TCP/IP4 / Propiedades](http://www.interusers.eu/wp-content/uploads/2012/05/tutob2.png)](http://www.interusers.eu/wp-content/uploads/2012/05/tutob2.png)




Después a "Opciones avanzadas", se nos abre otra ventana y en la pestaña "DNS" nos situamos. Le damos a "Agregar", y añadimos, una por una, las DNS de las lista. Debes poner por lo menos 5 DNS, para no tener problemas de conexión y tener siempre una DNS que resuelva direcciones web.




[![Añadimos las DNS con mejor rendimiento.](http://www.interusers.eu/wp-content/uploads/2012/05/tutob4.png)](http://www.interusers.eu/wp-content/uploads/2012/05/tutob4.png)





#### Linux (gnome 2 y sus forks o derivaciones)


En Linux, cambia un poco la cosa, después de haber seguido los pasos principales bajo el emulador Wine (o al haber anotado las DNS desde Windows), procedemos a incorporarlas a nuestra conexión bajo este sistema. Usaré la distribución Linux Ubuntu como ejemplo, siendo parcialmente similar en otras distribuciones bajo el entorno Gnome.

Primero, hacemos click en "Sistema", situado en la barra superior del escritorio, y señalamos la sección "Preferencias". Se nos abrirá otro submenú donde haremos click en el acceso "Conexiones de red".


[![Sistema / Preferencias / Conexiones de red](http://www.interusers.eu/wp-content/uploads/2012/05/tutol1.png)](http://www.interusers.eu/wp-content/uploads/2012/05/tutol1.png)




Se abre la ventana de la conexiones de red. Ahí se puede configurar todo tipo de conexiones, desde LAN hasta PPP. Seleccionamos la conexión a modificar (LAN o WIFI) y le damos a "Editar".




[![Seleccionamos nuestra conexión y pulsamos "editar"](http://www.interusers.eu/wp-content/uploads/2012/05/tutol2.png)](http://www.interusers.eu/wp-content/uploads/2012/05/tutol2.png)




Se abrirá otra ventana, en la cual pondremos en "Método" la opción "Sólo direcciones automáticas (DHCP)" o la opción "Manual". Y en la sección "Servidores DNS" indicamos las direcciones primeras del programa ejecutado.




[![Modo "Manual" o "DHCP direcciones automáticas" e introducimos las DNS.](http://www.interusers.eu/wp-content/uploads/2012/05/tutol3.png)](http://www.interusers.eu/wp-content/uploads/2012/05/tutol3.png)




Eso es todo por parte del tutorial, ya podrá disfrutar de un mejor rendimiento en la navegación sin apenas invertir en nuevas piezas o aumentos de velocidad al operador de red, de forma gratuita. Suerte en tu navegación y puedes preguntar o comentar en el foro.




El texto de este tutorial (exceptuando enlaces y capturas) está registrado bajo la licencia creative commons.
El programa DNS Benchmark es un programa creado por Steve Gibson.
Windows 7 es un sistema operativo creado por Microsoft Corporation.
[![Licencia de Creative Commons](http://www.interusers.eu/wp-content/uploads/2012/05/88x31.png)](http://creativecommons.org/licenses/by-nc-sa/3.0/)
Tutorial Interusers: Cómo mejorar el acesso a las páginas web. 3º edición. by [A.Gonzalez (Aglezabad)](http://www.interusers.eu/2012/reducir-tiempo-acceso-web/) is licensed under a [Creative Commons Reconocimiento-NoComercial-CompartirIgual 3.0 Unported License](http://creativecommons.org/licenses/by-nc-sa/3.0/).

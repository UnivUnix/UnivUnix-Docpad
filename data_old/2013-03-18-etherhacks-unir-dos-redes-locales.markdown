---
author: Aglezabad
comments: true
date: 2013-03-18 20:00:11+00:00
layout: post
slug: etherhacks-unir-dos-redes-locales
title: 'Etherhacks: Unir dos redes locales'
wordpress_id: 185
categories:
- Tutoriales
following_users:
- Aglezabad
tags:
- Ethernet
- Hacks
- Redes
---

[![ethernet-cable-utp-mold-type-kb-aa06](http://www.univunix.com/wp-content/uploads/ethernet-cable-utp-mold-type-kb-aa06-e1362690396731-300x259.jpg)](http://www.univunix.com/wp-content/uploads/ethernet-cable-utp-mold-type-kb-aa06.jpg)A menudo es normal que tengamos que realizar diversas tareas de administración en nuestra red local, pero lo normal (al menos en entorno profesional) es la restricción a modificar los parámetros de la puerta de enlace. En algún momento, es primordial realizar una tarea a distancia en tiempo récord, sin perjudicar la calidad de servicio.

El origen de este tutorial está basado en una petición que realizó un compañero de trabajo, cuya solución es, cuanto menos, interesante.


### Índice


Este tutorial se compone de las siguientes secciones:



	
  * Caso de estudio.

	
  * Planteamiento y aplicación de la solución.

	
  * Pros y contras de la solución.




### Caso de estudio


Tenemos el siguiente caso de estudio. Estamos en una red de área local, en la que un usuario concreto necesita tener acceso al exterior para realizar tareas de gestión remota. Un proceso muy sencillo, pero que se complica completamente cuando tenemos en cuenta que no tenemos **ningún acceso** al equipo que gestiona las redes y los enrutamientos.

Para solucionar este problema, usamos un router 3g para realizar el acceso externo  pero luego tendríamos que cambiar la puerta de enlace de todos los equipos que fuesen necesarios. Para evitar de alguna forma con este problema, vamos a usar el mismo rango ip que el rango de nuestra red.


### Planteamiento y aplicación de la solución.


[![diagramaRedes](http://www.univunix.com/wp-content/uploads/diagramaRedes-212x300.png)](http://www.univunix.com/wp-content/uploads/diagramaRedes.png)Para tener un acceso directo a los equipos de gestión, podemos usar un router 3g como he dicho, pero luego esos equipos deben tener como puerta de enlace dicho router. Si cambiamos la puerta de enlace en un solo equipo, no es un gran inconveniente, pero si necesitamos realizar el cambio a  30 o 40 equipos, la tarea se convierte en una tortura para cualquiera.

Para ello, aprovecho el funcionamiento del protocolo Ethernet para "fingir" que los equipos de la LAN y los equipos del router pertenezcan a la misma red. En base a lo mencionado por diversos expertos en seguridad, el protocolo Ethernet distribuye todos los paquetes a todos las ips de su rango, idea que se aprovechó para el uso de sniffers como Wireshark. Así pues, hacemos que el router 3g tenga el mismo rango de red que nuestra red LAN ycambiaremos la puerta de enlace en un solo equipo, con el fin de poder tener acceso exterior. Después, desde el equipo modificado (EQUIPO 2) podemos llamar al resto de equipos de la red, ya que ambos routers creerán que tanto EQUIPO1 como EQUIPO2 pertenecen a su red.  En nuestro caso, la red LAN tiene como puerta de enlace ("gateway") la ip 10.0.0.10 y distribuye los datos al rango 10.0.0.11 - 10.0.0.254. Así que el router, con puerta de enlace 10.0.0.100, tendrá el mismo rango de direcciones ip.

Se omite el cómo configurar el enrutamiento NAT para obtener acceso externo a través de puertos determinados, ya que considero que esa parte no tiene cabida en este artículo, aparte de haber cientos de artículos en la red que explican cómo realizar el enrutamiento necesario.






### Pros y contras de la solución.


Como parte positiva, cabe decir que este "hack" es una solución rápida para obtener acceso externo por un tiempo determinado, siempre que sea una forma temporal e inmediata. Como contra, existe la posibilidad de que puedan existir conflictos de direcciones IP, porque alguno de los "gateways" crea que una dirección determinada no esté en uso. También existe el riesgo de estar abriendo una especie de "puerta trasera" en la red, por lo que se recomienda quitar esta solución cuando ya no sea necesaria.



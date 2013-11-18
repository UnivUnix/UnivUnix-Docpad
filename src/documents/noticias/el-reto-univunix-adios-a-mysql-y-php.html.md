---
authors: ['Aglezabad']
date: 2013-06-19 16:51:59+00:00
layout: post
slug: el-reto-univunix-adios-a-mysql-y-php
title: 'El reto UnivUnix: Adiós a MySQL y PHP.'
categories: ['debian', 'linux', 'noticias']
tags: ['php', 'mysql']
---

Después de una semana y media, ha habido diversas novedades en la reforma de la web. Como mencionamos anteriormente, vamos a intentar introducir esta web en una Raspberry Pi, por motivos de consumo energético y costes. Después de preparar la raspberry para su funcionamiento (overclock, configuración del sistema e intentar reducir el total de paquetes en uso), hemos comenzado a desarrollar la nueva web.

### Introduciendo dinámica en una web plenamente estática.

El nuevo sistema tendrá el mismo diseño, pero la dinámica de la web pasará a realizarla el cliente. Eso significa que, por el lado del servidor, no se procesarán páginas, solamente se servirán. El cliente, gracias a **Javascript (JQuery y AJAX),** cogerá los elementos necesarios para componer las distintas páginas de la web. El medio para almacenar el contenido pasará a ser **XML o JSON**, optando por este último debido al rendimiento que tiene junto con Javascript.

Esto tiene sus pros y sus contras. Como parte positiva, tendremos un sistema que no requerirá el uso de los paneles de administración,  ya que la edición de contenido será muy sencilla. También, al utilizar Javascript y **HTML5**, la carga del servidor se reducirá, ya que la generación lo hará Javascript. Y por último, gracias a AJAX, no será necesario recargar el contenido cuando nos desplacemos por la web, con lo que se cargan los elementos necesarios en el momento adecuado.

Como contra, tendremos problemas con el SEO, ya que algunas "arañas" no soportan correctamente Javascript, por lo que es posible que no vean el contenido de la página u otros fenómenos. También tiene el punto negativo del rendimiento, ya que algunos equipos no podrían soportar las operaciones de Javascript (aunque la mayoría de navegadores ya tienen un buen procesado del lenguaje). Esperemos que estos inconvenientes sean pasajeros, ya que podremos hallar la manera de sortearlos.

Permanezcan atentos a las novedades, ya que iremos mencionando algunos cambios.
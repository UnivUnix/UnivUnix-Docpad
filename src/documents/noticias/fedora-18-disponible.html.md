---
authors: ['Aglezabad']
date: 2013-01-16 15:00:56+00:00
layout: post
title: Fedora 18 ya está disponible
thumbnail: ['/attachments/2013/01/fedora-logo.png', 'Logo de Fedora']
categories: ['fedora', 'linux', 'noticias']
tags: ['novedades', 'versiones']
---

[![fedora-logo](http://www.univunix.com/wp-content/uploads/fedora-logo-300x296.png)](http://www.univunix.com/wp-content/uploads/fedora-logo.png)Por fin ya está aquí, Fedora 18 llega con cambios notables e importantes, entre los que se incluye una mejor compatibilidad en entornos _dual-boot_ con Windows 8, que explicaremos en detalle a continuación; y el rediseño de anaconda, el instalador del sistema. He aquí la lista de cambios:



	
  * La **versión del kernel** Linux por defecto será la **3.6.0.**



	
  * En esta versión, se incluye una revisión del driver _ntfs-3g_ en el cual **envía una advertencia al usuario** **cuando** se **intenta montar particiones pertenecientes a Windows 8** con _fast-boot_ activado. Con ello, se evita la pérdida de datos en dichas particiones.



	
  * **El modo ****_Secure boot_ de las placas con bios UEFI es compatible con Fedora 18.** Con ello, ya se puede arrancar el sistema con este modo activado en el software de la placa base. También están disponibles las herramientas necesarias para generar los certificados necesarios.



	
  * En cuanto a la parte perteneciente al sistema de ficheros, se añade un formato nuevo, **FedFS**, y el **paso de la carpeta /tmp** a un sistema de ficheros en memoria (**tmpfs**).



	
  * Por último, cabe destacar el rediseño del instalador del sistema, **anaconda**, que cambia tanto en diseño, como en uso y rendimiento, mejorando este último usando tareas de background para la instalación del sistema operativo.


Estos aspectos son los que habría que destacar, ya que el resto de cambios se atribuyen a soluciones de bugs, poner como obsoleto algunas órdenes y añadir las últimas versiones de las aplicaciones.

Ya está disponible [en el portal de la distribución](http://fedoraproject.org/get-fedora?stF18) para su descarga, así que os animo a obtenerla y probarla.

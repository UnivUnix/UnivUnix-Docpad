---
author: Ferthedems
comments: true
date: 2013-02-12 19:48:15+00:00
layout: post
slug: comandos-terminal-4-grepeando
title: 'Comandos terminal (4): "grepeando"'
wordpress_id: 133
categories:
- Linux
- Tutoriales
following_users:
- Ferthedems
tags:
- Bash
- Comandos
- Linux
- Terminal
- Tutoriales
---

![Filter data icon](http://www.univunix.com/wp-content/uploads/filter_data-150x150.png)El comando **grep** es un filtro que sirve para _escoger de un texto_ (o de una salida estándar en la terminal) las _líneas que coinciden_ con un determinado _patrón_.




Tiene algunas opciones, aunque para el caso expondremos las básicas _(y más que suficientes para manejarnos)_:






* * *




Sintaxis básica _(Recordad que los corchetes indican que es opcional)_:




    
    grep [OPCIONES] PATRÓN [ARCHIVO...]




#### Opciones adicionales









Opción
Significado







 -v


 Muestra las **líneas que no contienen** el **patrón** de búsqueda.






 -n


**Enumera** las líneas que muestra en la salida.






 -c


 Muestra el **número de líneas** que coinciden con la expresión.






 -i


**Deja de ser sensitivo** a _mayúsculas_ y _minúsculas_.






 -o


Muestra la **parte de la línea que coincide** con la expresión en lugar de toda la línea.






 -E


Ejecuta grep con **soporte para expresiones regulares**.






 -e [patron1] -e [patron2]


Permite **buscar varias coincidencias**.




Nota: Para ver **más opciones** podéis consultar el **manual de grep** con el comando _man grep_.



* * *





### Ejemplos


Veamos algunos ejemplos del comando:

    
    cat /etc/fstab | grep "^#"




Muestra las líneas del archivo /etc/fstab que empiezan con # _(o lo que es lo mismo, que están comentadas por completo)_.




    
    cat /etc/fstab | grep -v "^#"




Muestra las líneas del archivo /etc/fstab que NO empiezan con # _(o lo que es lo mismo, que no están comentadas por completo)_.




    
    cat /etc/fstab | grep -e "ext4" -e "swap"






Muestra las líneas del archivo /etc/fstab que contienen _ext3 _o _swap_.


###  Ejemplo extra




Vamos a finalizar con una de mis aplicaciones preferidas y que no formaba parte de este artículo en el momento en el que fue escrito. Cuando estábamos en _proceso de crear esta web_, la plantilla de base sobre la que se construyó el diseño del foro utilizaba algunas funciones _php_ "deprecated" _(esto es, que ya no formaban parte del API de la aplicación)_ debido a que el código estaba algo desactualizado. Teníamos que editar un **número elevadísimo** de arhivos HTML, y era difícil saber cuáles eran los que contenían la sentencia que teníamos que cambiar.




Aquí es donde interviene **Grep**. Si miramos el manual, veremos que existe un flag que nos dice en qué línea se ha encontrado la ocurrencia:




    
    <strong>-n, --line-number</strong> - Prefix each line of output with the 1-based line number within its input file. (-n is specified by POSIX.)


Genial. Ya sabíamos cómo averiguar en qué número de línea de un archivo se encuentra la ocurrencia. ¿Y para varios archivos en formato _.html_?

Sencillo. Posicionándonos con **cd** en la carpeta donde están esos archivos, ejecutamos:

    
     grep -nr <span style="text-decoration: underline;"><em>ocurrencia</em></span> *.html


Y nos dice en qué línea y de qué archivo está la ocurrencia. El flag -**_r_** serviría para comprobar los posibles subdirectorios.

Aquí muestro un ejemplo con un proyecto de la universidad, en el que mediante _grep_ he obtenido los archivos y las líneas en las que aparece un enlace _(href)_.

[caption id="attachment_156" align="aligncenter" width="648"]![grep html](http://www.univunix.com/wp-content/uploads/Captura-de-pantalla-de-2013-02-12-204627.png) Ejemplo en una sesión de Bash[/caption]



[alert text="Nota para antiguos lectores de **niferniware.com**: este artículo ha sido movido por su autor desde _niferniware.com_ para que pase a formar parte de la comunidad. Ahora el artículo sólo podrá encontrarse en esta web para evitar contenidos duplicados."]



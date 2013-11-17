---
authors: ['Ferthedems']
date: 2013-02-10 12:19:26+00:00
layout: post
title: 'Comandos terminal (1): entrada y salida estándar'
thumbnail: ['/attachments/2013/02/terminal_icon.jpg', 'El terminal es una aplicación muy potente siempre desaprovechada.']
categories: ['linux', 'tutoriales']
tags: ['bash', 'comandos', 'terminal']
---

He decidido hacer **varias publicaciones** en las que detallaré **cómo utilizar los comandos de la terminal** más básicos de nuestro Linux, de forma que, cuando hayamos aprendido a manejarnos con ellos, podremos **diseñar scripts para Bash** que automaticen múltiples tareas de una forma eficiente en términos de código.

Tenemos que tener en cuenta que lo que coloquialmente llamamos _terminal_ es un emulador de la línea de comandos de Linux, que es el equivalente a lo que se nos mostraría si instalásemos nuestro sistema sin un _entorno gráfico_. Uno de los puntos más importantes es entender a la terminal como una herramienta de gran potencia, que aunque en la opinión de algunos está obsoleta, en ocasiones puede ser **más eficaz que la mejor de las aplicaciones gráficas**. Por tanto no tenemos que tener ningún miedo a trabajar con ella.
	
  * Entrada y salida estándar
  * Redirección
  * Enviar la salida estándar a un archivo
  * Utilizar como entrada un fichero
  * Unir la salida estándar de un comando con la entrada estándar de otro comando

### Comenzamos

Antes de conocer y manejar los comandos, es importante entender algunos **conceptos** como la **entrada y salida estándar** de Linux, así como el manejo de las **tuberías**.

Cuando iniciamos una sesión de un sistema basado en Unix, **tres archivos** se cargan en la memoria. Estos archivos son **stdin** _(entrada estándar)_, **stdout** _(salida estándar)_ y **stderr** _(salida estándar de errores)_. El intérprete de comandos se encarga de que estos archivos apunten hacia el teclado en el caso de stdin, o hacia el monitor en el caso de los restantes.

De esta manera, cuando nosotros _tecleamos un comando_, se sucederán un _conjunto de acciones_:
  * La aplicación que ejecutamos nos puede pedir información de entrada, que será almacenada en _stdin_.
  * La información será procesada por la aplicación, que generará un resultado de su ejecución.
  * Se volcará una respuesta en _stdout_ o el sistema mandará un error a _stderr_.
  * Por último, el resultado de la ejecución será mostrado a través de un canal, generalmente la _pantalla_.

Esto es muy básico y a priori no tiene ningún interés para nuestros fines manejando la terminal. Pero, _¿Y si cambiamos el comportamiento de este mecanismo?_

Imaginemos que la respuesta generada como resultado de la ejecución de un programa _(lo que hemos denominado **salida**)_ precisa de ser almacenada en un fichero en lugar de mostrarse por la pantalla. Es más, imaginemos que lo queremos es que la salida de un comando se convierta en la entrada para otro comando, en lugar de escribir la entrada manualmente. Existen numerosas posibilidades, y aquí es donde interviene lo que usualmente conocemos como **redirección**.

### Redirección

Este es un capítulo interesante ya que nos será de utilidad en las próximas publicaciones sobre la terminal. Existen múltiples tipos de redireccionamiento. Aquí los veremos uno por uno:

#### Enviar la salida estándar a un archivo

En este caso, invocamos el comando y añadimos al final el símbolo ">" (mayor que) seguido de la ruta del fichero donde queremos escribir la salida del programa. Podemos usar el símbolo ">" si lo que queremos es arrasar el contenido del fichero y añadir la salida del programa, o bien ">>" (dos veces el símbolo mayor que) si lo que queremos es añadir la salida al final del fichero respetando su contenido. Su sintaxis podría ser algo semejante a:
    
    comando [opciones] < archivo.txt

Y un ejemplo básico (para ir entrando en calor) podría ser:
    
    <em id="__mceDel">$ ls > listadoDeDirectorio.txt</em>

_ Tras ejecutar esto, si buscamos en nuestro home el archivo listadoDeDirectorio.txt y lo abrimos, veremos que la salida del comando ls (osea, lo que contenía el directorio que hemos listado) se ha escrito en el susodicho archivo._

<div class="alert alert-danger">
  No olvidéis que _>>_ es aditivo, pero > es **destructivo**. Borrará el contenido del fichero."
</div>

#### Utilizar como entrada un fichero

Para ello, invocamos el comando y añadimos al final el símbolo "<" (menor que) seguido de la ruta del fichero. La sintaxis podría ser algo similar a:
    
     comando [opciones] < archivo.txt

#### Unir la salida estándar de un comando con la entrada estándar de otro comando

Esta es una de las acciones más interesantes. Lo que produce un comando queremos que lo tome otro comando como entrada. En los sistemas tipo Unix esto se conoce como tubería (pipe) y es una de las virtudes más poderosas del sistema.

Primero invocamos un comando, a continuación añadimos el símbolo "|" (barra vertical) e invocamos el comando que recibe la entrada. La sintaxis se correspondería a algo semejante a:
    
    comando_a [opciones] | comando_b [opciones] | ... | comando_n [opciones]

Y un último ejemplo podría ser:
    
     $ ls -l | head -5

En este caso el comando **head** _(que explicaremos en la próxima publicación)_ se encarga de mostrar las cinco primeras líneas generadas por el comando **ls**, que a su vez se ha encargado de listar un directorio.

En mi próxima publicación veremos los **comandos encargados de mostrar el contenido de un fichero**. Muy útiles a la hora de trabajar con archivos de configuración, entre otros usos.

<div class="alert alert-info">
Nota para antiguos lectores de **niferniware.com**: este artículo ha sido movido por su autor desde _niferniware.com_ para que pase a formar parte de la comunidad. Ahora el artículo sólo podrá encontrarse en esta web para evitar contenidos duplicados."
</div>
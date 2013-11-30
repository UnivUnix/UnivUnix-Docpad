---
authors: ['Aglezabad']
date: 2013-11-27 20:30:52+01:00
layout: post
title: 'Construye tu sitio web con Docpad y sé rápido usando estático.'
thumbnail: ['/attachments/2013/11/docpad.png', 'Docpad']
categories: ['programación', 'tutoriales']
tags: ['nginx', 'docpad', 'web', 'nodejs', 'javascript']
---

Hace poco tiempo, os explicamos a través de esta web el motivo por el cual no publicábamos con frecuencia: cambiamos de motor gestor de contenidos, con el fin de hacer más rápida la respuesta de la misma y para evitar el uso de servicios innecesarios o superfluos. Elegimos múltiples alternativas hasta que nos topamos con **Docpad**.

Docpad es un **gestor de contenidos agnóstico en lenguaje** basado en la tecnología NodeJS. La pregunta que ronda a muchos es: ¿a qué se refiere con *"agnóstico en lenguaje"*? Para el autor, Benjamin Lupton, se refiere a que **no es necesario saber un lenguaje concreto para crear la página**, por lo que podemos usar desde javascript, css y html; hasta php, less y handlebars. Esto es debido a su **remesa de plugins** con gran capacidad de selección.

Otro de los puntos clave de Docpad es la posibilidad de **generar tanto contenido estático como contenido dinámico**, todo gracias a un pequeño metadato que incorporamos en la página deseada. Y por último, de una gran lista de características que pueden ver en la [web del proyecto](http://docpad.org "Docpad"), es **opensource** (licencia MIT), lo que nos permite crear desarrollo propios bajo la licencia que queramos siempre que respetemos las condiciones de su licencia.

Después de este breve resumen, procedemos a explicar la instalación de dicho programa y de cómo crear una página web.

###Instalación

Antes de instalar nada, tenemos que completar el requisito necesario: la instalación de NodeJS. Para dicha instalación, basta con buscar en los repositorios de tu distribución Linux o acudir a [la web de NodeJS](http://nodejs.org "NodeJS"). Lo más normal es que venga incluido en el paquete el programa npm (**Node Package Manager**), un programa al estilo de pip en Python que descarga e instala los módulos node necesarios.

Ahora que tenemos cumplidos todos los requisitos, procedemos a través de terminal con la instalación de Docpad:

        sudo npm install -g docpad

###Creación de la página

Tras completar la instalación, buscamos una carpeta a nuestra elección:

        mkdir proyectoweb
        cd proyectoweb

E iniciamos Docpad:

        docpad run

Nos pedirá que aceptemos los términos y condiciones, y nos ofrecerá la posibilidad de suscribirnos a su boletín de noticias (el cual informa de novedades y consejos). Tras ello, nos pedirá la solicitud de uno de los esqueletos disponibles o optar por no usar esqueleto.

Para aclararlo, los esqueletos de Docpad (Docpad skeletons) son estructuras web prefabricadas y diseñadas para funcionar al cien por cien con la aplicación, lo que facilita la superación de la curva de aprendizaje. Por recomendación propia, elegid los esqueletos de Twitter Bootstrap, ya que son los que se usaron para UnivUnix y además, dichos esqueletos usan lenguajes como cofeekup y eco (coffeescript embebido), que son los lenguajes de mayor uso con Docpad (y por tanto, los más sencillos de aprender).

Por último, tomad la libertad de probar el esqueleto, ver su funcionamiento, y empezar a construir vuestra web usando la estructura definida. Y si tenéis dudas, podéis consultarlas a través de los comentarios (no hay foro en UnivUnix por el momento), o a través de [Stack Overflow](http://stackoverflow.com/questions/tagged/docpad), donde el creador del programa y usuarios del mismo os ayudarán en la medida de lo posible.

Muy pronto haré una breve explicación de Coffeekup, Coffeescript y Eco para facilitar el uso de Docpad.



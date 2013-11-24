---
authors: ['Aglezabad']
date: 2013-11-24 00:44:06+01:00
layout: post
slug: cambia-las-librerias-locales-por-las-de-cdnjs
title: Cambia las librerías locales por las de CDNJS.
thumbnail: ['/attachments/2013/11/JavaScript-logo.png', 'Logo de Javascript']
categories: ['tutoriales']
tags: ['cdn', 'cdnjs', 'cloudflare', 'javascript', 'php', 'web', 'wordpress']
---

Como todo el mundo sabe, para mejorar los tiempos de retorno (el tiempo que tarda en verse la página), podemos usar las librerías alojadas en el cdn de Google, pero no dispone de todas las librerías, como por ejemplo, modernizr. Pero ya hay una solución disponible, y esa es CDNJS.

CDNJS es un proyecto creado en 2011 cuyos encargados principales son Ryan Kirkman y Thomas Davis, soportado con la infraestructura de Cloudflare, una empresa que ofrece servicios CDN gratuitos y de pago. El objetivo de este proyecto es guardar en un CDN público la mayoría de las librerías javascript que se usan, como modernizr o bootstrap. Con ello, se consigue reducir los tiempos de espera y, al tener otro servidor de origen (y el más cercano), la carga de la página mejora con creces.

Lamentablemente, durante la edición de este artículo, no existe plugin disponible para aplicarlo en Wordpress, a diferencia del CDN de Google (Use Google libraries). Para ello, necesitamos hacerlo de forma manual, beneficioso también para reducir plugins en uso. Aquí tenéis la función, la cual es una modificación de la que publicó wpbeginner para Google CDN.

    
    //CDNJS
    function modify_js() {
        if (!is_admin()) { //Con esto, recurrimos a las librerías locales en caso de estar administrando nuestra instalación Wordpress. Así evitamos problemas.
            //Esta es la librería común de todas las instalaciones de wordpress (jquery).
            wp_deregister_script('jquery');
            wp_register_script('jquery', 'http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js', false, '1.8.3');
            wp_enqueue_script('jquery');
            //Si usas Bones de Themble, esto cambia la librería modernizr. Debes quitar esta parte si no lo tienes.
            wp_deregister_script('bones-modernizr');
            wp_register_script('bones-modernizr', 'http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js', false, '2.6.2');
            wp_enqueue_script('bones-modernizr');
        }
    }
    add_action('init', 'modify_js');


Si quieren añadir más librerías que usen, solo tienen que mirar el código del tema que usen o de los propios plugins activos. Yo, por ejemplo, utilizaba un plugin para usar la librería jquery-lazyload (evita la carga de imágenes que no estén en visualización), pero al parecer, no está disponible en el CDN. Así pues, me tocará esperar.

Los resultados de aplicar el cambio son notables, se reduce bastante en tiempo de descarga en esos ficheros, y con un uptime del 100%, es una alternativa sólida y que recomiendo. Espero que les haya servido.

<div class="alert alert-info">
Ante el cierre de **Interusers**, los artículos destacables de Aglezabad, autor de dicha web, serán alojados en UnivUnix.
</div>
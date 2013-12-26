---
authors: ['Aglezabad']
date: 2013-12-25 21:52:50+01:00
title: Coffeekup, el lenguaje de marcado para Coffeescript
layout: post
thumbnail: ['/attachments/2013/12/coffeekup.png', 'Logo de Coffeekup.']
categories: ['tutoriales']
tags: ['coffeekup', 'coffeescript', 'javascript', 'web', 'html']
---
Como continuación al [anterior artículo en donde hablabámos sobre Docpad](http://www.univunix.com/tutoriales/sitio-web-veloz-con-docpad), tenemos un pequeño tutorial sobre coffekup, uno de los lenguajes usados en esta aplicación y en esta web.

Coffeekup es un lenguaje de marcado basado en Coffeescript (una abstración de Javascript) que permite la simplicación del lenguaje HTML. Nació con el objetivo de unificar en uno tanto HTML como Javascript y su uso está enfocado principalmente a programación de webs bajo la tecnología NodeJS.

Con el fin de facilitar el inicio en este lenguaje y dado que no hay documentación suficiente acerca de su sintaxis, vamos a proceder con la explicación de los elementos.

###Doctype
El doctype, conocido en HTML como la expresión de la tecnología usada (XHTML o HTML5), se expresa de las siguientes formas:

<table class="table table-striped">
    <thead>
        <tr>
            <th>Coffeekup</th>
            <th>HTML</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>doctype 5</td>
            <td>Doctype HTML5</td>
        </tr>
        <tr>
            <td>doctype 'transitional'</td>
            <td>Doctype XHTML transicional</td>
        </tr>
        <tr>
            <td>doctype 'strict'</td>
            <td>Doctype XHTML estricto</td>
        </tr>
        <tr>
            <td>doctype 'frameset'</td>
            <td>Doctype XHTML frameset</td>
        </tr>
        <tr>
            <td>doctype '1.1'</td>
            <td>Doctype XHTML 1.1</td>
        </tr>
        <tr>
            <td>doctype 'basic'</td>
            <td>Doctype XHTML basic 1.1</td>
        </tr>
        <tr>
            <td>doctype 'mobile'</td>
            <td>Doctype XHTML mobile 1.2</td>
        </tr>
        <tr>
            <td>doctype 'ce'</td>
            <td>Doctype XHTML transicional con dtd ce</td>
        </tr>
        <tr>
            <td>doctype 'xml'</td>
            <td>Doctype XML</td>
        </tr>
    </tbody>
</table>

###Cómo usar Coffeekup.
Hay múltiples formas de usar Coffeekup en los distintos frameworks que hay para NodeJS, y ya que la [documentación de Coffeekup lo explica bien](https://github.com/mauricemach/coffeekup/blob/master/README.md) en ese punto, vamos a explicar solamente cómo hacerlo en Docpad, objetivo de este artículo.

El uso normal de Coffeekup en Docpad es el de crear plantillas para incrustar el contenido de una página en el mismo, pero también puede servir para crear páginas completas. Nos basaremos en el primer caso, ya que la diferencia entre usos es mínima.

Lo más normal que haremos es crear un nuevo fichero de plantilla en src/layouts con el editor que más nos guste (Aptana, Sublime, Nano...). Haremos una página en HTML5, por lo que no puede faltar el doctype.

    doctype 5

Después tendremos el siguiente punto de todo HTML, que es abrir el elemento del mismo nombre. La gran diferencia es que en este lenguaje no es necesario incluir el cierre de elemento, ya que el parser determina según la tabulación qué elementos pertenecen al interior y cuáles al exterior.

    html -> #Las flechas indican que hay contenido dentro del elemento.
        head ->
            #Contenido de head
        body ->
            #Contenido de body
        #Contenido fuera de body
    #Contenido fuera de html

Un ejemplo sencillo lo tenemos aquí, es el ejemplo que hay en la página principal de [CoffeeKup](http://coffeekup.org), pero simplificado.

    doctype 5
        html ->
            head ->
                meta charset: 'utf-8'
                title "Foo | My awesome website"
                meta(name: 'description', content: @desc) if @desc?
                link rel: 'stylesheet', href: '/stylesheets/app.css'
                style '''
                    body {font-family: sans-serif}
                    header, nav, section, footer {display: block}
                '''
                script src: '/javascripts/jquery.js'
        body ->
            header ->
                h1 "Foo"
                nav ->
                    ul ->
                        (li -> a href: '/', -> 'Home') unless @path is '/'
                        li -> a href: '/chunky', -> 'Bacon!'
                switch @user.role
                    when 'owner', 'admin'
                        li -> a href: '/admin', -> 'Secret Stuff'
                    when 'vip'
                        li -> a href: '/vip', -> 'Exclusive Stuff'
                    else
                        li -> a href: '/commoners', -> 'Just Stuff'
            section ->
                h2 "Let's count to #{@max}:"
                p i for i in [1..@max]
            footer ->
                p "Bye"

Como podéis ver, es completamente viable la inclusión de formas condicionales o bucles en la plantilla, con el fin de evitar repetir elementos y simplificar contenido. Todos los bucles y condiciones no pertenecen a CoffeKup sino a su lenguaje padre [Coffeescript, cuya documentación es sencilla y completa](http://coffeescript.org/)

Es obvio que todas las referencias a la documentación de ambos lenguajes se encuentran en Inglés, en textos fáciles de comprender y con ejemplos; además del repositorio en GitHub con los [ficheros fuente de la web](https://github.com/Aglezabad/UnivUnix-Docpad), hechos con este lenguaje. Si por algún casual tenéis problemas con CoffeeKup o con CoffeeScript, podéis comentar vuestra duda en los comentarios o en el foro, donde mejor os venga.
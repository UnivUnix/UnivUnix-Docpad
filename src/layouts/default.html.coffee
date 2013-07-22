doctype 5
html ->
  head ->
    title @getPreparedTitle()
    meta charset: "utf-8"
    meta "http-equiv": "content-type", "content": "text/html; charset=utf-8"
    meta "http-equiv": "X-UA-Compatible", "content": "IE=edge,chrome=1"
    meta "name": "description", "content": @getPreparedDescription()
    meta "name": "keywords", "content": @getPreparedKeywords()
    text @getBlock('meta').toHTML()
    meta "name": "viewport", "content": "width=device-width, initial-scale=1.0"

    link rel: "shortcut icon",                href: "/icons/favicon.ico"
    link rel: "apple-touch-icon",             href: "/icons/apple-icon.png"
    

    ie "lt IE 9", ->
      script async: yes, src: "http://html5shim.googlecode.com/svn/trunk/html5.js"

    text @getBlock('styles').add(@site.styles).toHTML()

    body class: "top-navbar", ->
      header class: "navbar navbar-fixed-top", ->
        div class: "navbar-inner", ->
          div class: "container", ->
            a class: "btn btn-navbar", 'data-target': ".nav-collapse", 'data-toggle': "collapse", ->
              for num in [3..1]
                span class: "icon-bar"
            a class: "brand", href: "/"
            nav id: "nav-main", class: "nav-collapse", ->
              ul class: "nav", ->
                for document in @getCollection('indexes').toJSON()
                  if document.indexOrder?
                    li typeof: "sioc:Page", about: document.url, class: ('active' if @document.url is document.url), ->
                      a href: document.url, property: "dc:title", ->
                        document.title
              div class: "navbar-text pull-right", ->
                a class: "twitter", href: "http://twitter.com/univunix", target: "_blank", title: "Síguenos en Twitter"
                a class: "facebook", href: "http://www.facebook.com/univunix", target: "_blank", title: "Síguenos en Facebook"
                a class: "gplus", href: "http://plus.google.com/b/107511248169675151833/107511248169675151833?rel=publisher", target: "_blank", title: "Síguenos en Google+"
                a class: "rss", href: @getUrl("/feeds/rss.xml"), target: "_blank", title: "Nuestro feed en RSS", ->
                    "RSS"
                a class: "rss", href: @getUrl("/feeds/atom.xml"), target: "_blank", title: "Nuestro feed en ATOM", ->
                    "ATOM"
    div id: "wrap", class: "container-fluid", ->
      section id: "content", class: "content row-fluid", ->
        div id: "main", class: "span9", ->
          text @content
        aside id: "sidebar", class: "span3", ->
          section id: "pages", class: "widget widget_pages", ->
            div class: "widget-inner", ->
              div class: "widgettitle", ->
                h3 ->
                  text "Acerca de:"
              div class: "widgetcontent", ->
                ul ->
                  for document in @getCollection('pages').toJSON()
                    li class: "page_item", ->
                      a href: document.url, property: "dc:title", ->
                        document.title
    
    footer id: "content-info", ->
      div class: "foot", ->
        div class: "row-fluid", ->
          div class: "span6 html", ->
            p ->
              i class: "mini-html5"
              text "HTML5"
              i class: "mini-css3"
              text "CSS3"
          div class: "span6 commons", ->
            p ->
              text "Contenido bajo licencia CC (BY-SA-NC)"
    
    text @getBlock('scripts').add(@site.scripts).toHTML()

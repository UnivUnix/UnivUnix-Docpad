doctype 5
html ->
  head ->
    title @getPreparedTitle()
    meta charset: "utf-8"
    meta "http-equiv": "content-type", "content": "text/html; charset=utf-8"
    ie "lt IE 9", ->
      meta "http-equiv": "X-UA-Compatible", "content": "IE=edge,chrome=1"
    meta "name": "description", "content": @getPreparedDescription()
    if @getPreparedKeywords() != ""
      meta "name": "keywords", "content": @getPreparedKeywords()
    meta "name": "viewport", "content": "width=device-width, initial-scale=1.0"

    link rel: "shortcut icon",                href: "/icons/favicon.ico"
    link rel: "apple-touch-icon",             href: "/icons/apple-icon.png"
    
    ie "lt IE 9", ->
      script async: yes, src: "http://html5shim.googlecode.com/svn/trunk/html5.js"
    text @getBlock('styles').add(@site.styles).toHTML()

  body ->
    header class: "navbar navbar-fixed-top", ->
      div class: "container", ->
        button type: "button", class: "navbar-toggle", 'data-toggle': "collapse", 'data-target': ".navbar-responsive-collapse", ->
          for num in [3..1]
            span class: "icon-bar"
        a id:"brand", class: "navbar-brand", href: "/"
        div class: "nav-collapse collapse navbar-responsive-collapse", ->
          ul class: "nav navbar-nav", ->
            for document in @getCollection('indexes').toJSON()
              if document.indexOrder?
                li class: ('active' if @isDocCategory(@document.categories, document.title) or @document.url == document.url), ->
                  a href: document.url, property: "dc:title", ->
                    document.title
          ul class: "nav navbar-nav pull-right", ->
            li class: "dropdown", ->
              a class: "dropdown-toggle", 'data-toggle': "dropdown", href: "#social", ->
                text "Síguenos"
                span class: "caret"
              ul id: "follow-dropdown", class: "dropdown-menu", role: "menu", ->                     
                li role:"menuitem", ->
                  a href: "http://twitter.com/univunix", target: "_blank", title: "Síguenos en Twitter", ->
                    # i class: "btn-tt"
                    text "Twitter"
                li role:"menuitem", ->
                  a href: "http://www.facebook.com/univunix", target: "_blank", title: "Síguenos en Facebook", ->
                    # i class: "btn-fb"
                    text "Facebook"
                li role:"menuitem", ->
                  a href: "http://plus.google.com/b/107511248169675151833/107511248169675151833?rel=publisher", target: "_blank", title: "Síguenos en Google+", ->
                    # i class: "btn-gp"
                    text "Google +"
                li class: "divider"
                li class: "dropdown-header", ->
                  text "Feeds"
                li role:"menuitem", ->
                  a href: @getUrl("/feeds/rss.xml"), target: "_blank", title: "Nuestro feed en RSS", ->
                    # i class: "btn-rss"
                    text "RSS"
                li role:"menuitem", ->
                  a href: @getUrl("/feeds/atom.xml"), target: "_blank", title: "Nuestro feed en ATOM", ->
                    # i class: "btn-rss"
                    text "ATOM"
    div id: "wrap", class: "container", ->
      section id: "content", class: "content row", ->
        div id: "main", class: "col-sm-9 col-12 col-lg-9", ->
          text @content
        aside id: "sidebar", class: "col-sm-3 col-12 col-lg-3", ->
          section id: "pages", class: "widget widget_pages", ->
            div class: "widget-inner", ->
              div class: "widgettitle", ->
                h3 ->
                  text "Acerca de:"
              div class: "widgetcontent", ->
                ul ->
                  for document in @getCollection('pages').toJSON()
                    li class: ('active' if @document.url == document.url), ->
                        a href: document.url, property: "dc:title", ->
                          document.title
    
    footer class: "navbar navbar-fixed-bottom", ->
      div class: "container", ->
        p class: "navbar-text pull-left", ->
          text "Estándares: "
          a class: "navbar-link", href:"", ->
            i class: "html5-icon"
          a class: "navbar-link", href:"", ->
            i class: "css3-icon"
        p class: "navbar-text pull-right", ->
          a class: "navbar-link", href:"", ->
            i class: "cc-icon"
            text "BY-NC-SA"    
    text @getBlock('scripts').add(@site.scripts).toHTML()

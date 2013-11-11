doctype 5
html lang: "es", ->
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

    link rel: "shortcut icon",                href: "/icons/favicon.png"
    link rel: "apple-touch-icon",             href: "/icons/apple-icon.png"
    
    ie "lt IE 9", ->
      script async: yes, src: "http://html5shim.googlecode.com/svn/trunk/html5.js"
    text @getBlock('styles').add(@site.styles).toHTML()

  body ->
    header class: "navbar navbar-inverse navbar-fixed-top", role:"navigation", ->
      div class: "container", ->
        div class: "navbar-header", ->
          button type: "button", class: "navbar-toggle", 'data-toggle': "collapse", 'data-target': "#navigation", ->
            span class: "sr-only", ->
              text "Toggle navigation"
            for num in [3..1]
              span class: "icon-bar"
          a id:"brand", class: "sprite sprite-brand navbar-brand", href: "/"
        div id:"navigation", class: "collapse navbar-collapse navbar-ex1-collapse navbar-responsive-collapse", ->
          ul class: "nav navbar-nav", ->
            for document in @getCollection('categoryPages').toJSON()
              if document.categoryOrder?
                li class: ('active' if @isPageCategory(@document.categories, document.title) or @document.url == document.url), ->
                  a href: document.url, property: "dc:title", ->
                    document.title
          ul class: "nav navbar-nav pull-right", ->
            li ->
              a class: "sprite sprite-share", 'data-toggle': "modal", href: "#social"
  		div class: "modal fade", id: "social", ->
  			div class: "modal-dialog", ->
          div class: "modal-content", ->
            div class: "modal-header", ->
              h3 class: "modal-title", ->
                text "Síguenos en cualquier medio."
            div class: "modal-body", ->
              div id: "social-links", ->
                div class: "modal-link modal-link-facebook", ->
                  span ->
                    i class: "sprite sprite-modal sprite-modal-facebook"
                  a href:"http://www.facebook.com/univunix", target: "_blank", ->
                    text "Facebook"
                div class: "modal-link modal-link-twitter", ->
                  span ->
                    i class: "sprite sprite-modal sprite-modal-twitter"
                  a href:"http://twitter.com/univunix", target: "_blank", ->
                    text "Twitter"
                div class: "modal-link modal-link-google", ->
                  span ->
                    i class: "sprite sprite-modal sprite-modal-google"
                  a href: "http://plus.google.com/b/107511248169675151833/107511248169675151833?rel=publisher", target: "_blank", ->
                    text "Google+"
                div class: "modal-link modal-link-rss", ->
                  span ->
                    i class: "sprite sprite-modal sprite-modal-rss"
                  a href: "/feeds/rss.xml", target: "_blank", ->
                    text "RSS"
                div class: "modal-link modal-link-rss", ->
                  span ->
                    i class: "sprite sprite-modal sprite-modal-rss"
                  a href: "/feeds/atom.xml", target: "_blank", ->
                    text "ATOM"
            div class: "modal-footer", ->
              button 'type': "button", class: "btn btn-sm btn-default", 'data-dismiss': "modal", ->
                i class: "glyphicon glyphicon-remove"
                text "Cerrar"
    text @content
    footer class: "navbar navbar-inverse navbar-fixed-bottom", ->
      div class: "container", ->
        div class: "navbar-header", ->
          button type: "button", class: "navbar-toggle", 'data-toggle': "collapse", 'data-target': "#validation", ->
            span class: "sr-only", ->
              text "Toogle navigation"
            for num in [3..1]
              span class: "icon-bar"
        div id: "validation", class: "collapse navbar-collapse navbar-ex1-collapse navbar-responsive-collapse", ->
          ul class: "nav navbar-nav", ->
            li ->
              a class: "sprite sprite-html5", target:"_blank", href:"http://validator.w3.org/check?uri=http%3A%2F%2Fwww.univunix.com%2F"
            li ->
              a class: "sprite sprite-css3", target:"_blank", href:"http://jigsaw.w3.org/css-validator/validator?uri=www.univunix.com"
          ul class: "nav navbar-nav pull-right", ->
            li ->
              a class: "sprite sprite-cc", target:"_blank", href:"http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es_ES"
text @getBlock('scripts').add(@site.scripts).toHTML()

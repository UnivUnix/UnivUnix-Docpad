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

    link rel: "shortcut icon",                href: "/icons/favicon.ico"
    link rel: "apple-touch-icon",             href: "/icons/apple-icon.png"
    
    ie "lt IE 9", ->
      script async: yes, src: "http://html5shim.googlecode.com/svn/trunk/html5.js"
    text @getBlock('styles').add(@site.styles).toHTML()

  body ->
    header class: "navbar navbar-inverse navbar-fixed-top", role:"navigation", ->
      div class: "container", ->
        div class: "navbar-header", ->
          button type: "button", class: "navbar-toggle", 'data-toggle': "collapse", 'data-target': ".navbar-ex1-collapse", ->
            span class: "sr-only", ->
              text "Toogle navigation"
            for num in [3..1]
              span class: "icon-bar"
          a id:"brand", class: "sprite sprite-brand navbar-brand", href: "/"
        div class: "collapse navbar-collapse navbar-ex1-collapse navbar-responsive-collapse", ->
          ul class: "nav navbar-nav", ->
            for document in @getCollection('indexes').toJSON()
              if document.indexOrder?
                li class: ('active' if @isDocCategory(@document.categories, document.title) or @document.url == document.url), ->
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
                  a href:"", ->
                    text "Facebook"
                div class: "modal-link modal-link-twitter", ->
                  span class: "itwitter", ->
                    i class: "sprite sprite-modal sprite-modal-twitter"
                  a class: "atwitter", href:"", ->
                    text "Twitter"
                div class: "modal-link modal-link-google", ->
                  span class: "igoogle", ->
                    i class: "sprite sprite-modal sprite-modal-google"
                  a class: "agoogle", href: "", ->
                    text "Google+"
                div class: "modal-link modal-link-rss", ->
                  span class: "irss", ->
                    i class: "sprite sprite-modal sprite-modal-rss"
                  a class: "arss", href: "", ->
                    text "RSS"
                div class: "modal-link modal-link-rss", ->
                  span class: "irss", ->
                    i class: "sprite sprite-modal sprite-modal-rss"
                  a class: "arss", href: "", ->
                    text "ATOM"
            div class: "modal-footer", ->
              button 'type': "button", class: "btn btn-sm btn-default", 'data-dismiss': "modal", ->
                i class: "glyphicon glyphicon-remove"
                text "Cerrar"
    text @content
    footer class: "navbar navbar-inverse navbar-fixed-bottom", ->
      div class: "container", ->
        p class: "navbar-text pull-left", ->
          a class: "navbar-link", target:"_blank", href:"http://validator.w3.org/check?uri=http%3A%2F%2Fwww.univunix.com%2F", ->
            i class: "sprite sprite-html5"
            text "HTML5"
          a class: "navbar-link", target:"_blank", href:"http://jigsaw.w3.org/css-validator/validator?uri=www.univunix.com", ->
            i class: "sprite sprite-css3"
            text "CSS3"
        p class: "navbar-text pull-right", ->
          a class: "navbar-link", target:"_blank", href:"http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es_ES", ->
            i class: "sprite sprite-cc"
            text "BY-NC-SA"
script type:"text/javascript", ->
  text 'var disqus_shortname="univunix";(function(){var e=document.createElement("script");e.async=true;e.type="text/javascript";e.src="//"+disqus_shortname+".disqus.com/count.js";(document.getElementsByTagName("HEAD")[0]||document.getElementsByTagName("BODY")[0]).appendChild(e)})()'
text @getBlock('scripts').add(@site.scripts).toHTML()

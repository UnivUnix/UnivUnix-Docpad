---
layout: main
---

header class: "navbar navbar-inverse navbar-fixed-top", ->
  div class: "container", ->
    div class: "navbar-header", ->
      button type: "button", class: "navbar-toggle", 'data-toggle': "collapse", 'data-target': "#navigation", ->
        span class: "sr-only", ->
          text "Toggle navigation"
        for num in [3..1]
          span class: "icon-bar"
      a id:"brand", class: "fadepage sprite sprite-brand navbar-brand", href: "/"
    div id:"navigation", class: "collapse navbar-collapse navbar-ex1-collapse navbar-responsive-collapse", ->
      ul class: "nav navbar-nav", ->
        for document in @uniqueArray(@getCollection('categoryPages').toJSON())
          if document.categoryOrder?
            li class: ('active' if @isPageCategory(@document.categories, document.title) or @document.url == document.url), ->
              a class: "fadepage", href: document.url, property: "dc:title", ->
                document.title
        li ->
          a class: "fadepage", href: "http://forum.univunix.com/", ->
            text "Foro"
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
  div class: "container navbar-center", ->
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
        li ->
          a class: "sprite sprite-cc", target:"_blank", href:"http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es_ES"
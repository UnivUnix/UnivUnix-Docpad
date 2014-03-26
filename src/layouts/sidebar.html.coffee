---
layout: navbars
---
section id: "content", class: "container", ->
  div class: "row", ->
    div class: "col-lg-12", role: "cookietool", ->
      div id: "cookieTool"
  div class: "row", ->
    div class: "col-lg-9", role: "main", ->
      div class: "row", ->
        text @content
      div class: "row", ->
        div class: "col-lg-12", ->
          if @document.isPaged
            ul class: "pager", ->
              if @hasPrevPage()
                li class: "previous", ->
                  a href: @getPrevPage(), ->
                    text "Nuevos"
              else
                li class: "previous disabled", ->
                  a ->
                    text "Nuevos"
              if @hasNextPage()
                li class: "next", ->
                  a href: @getNextPage(), ->
                    text "Antiguos"
              else
                li class: "next disabled", ->
                  a ->
                    text "Antiguos"
    aside id: "sidebar", class: "col-lg-3", role: "complementary", ->
      section id: "pages", class: "widget row", ->
        div class: "widget-container col-lg-12", ->
          div class: "widget-title", ->
            h3 ->
              text "Acerca de:"
          div class: "widget-content", ->
            ul ->
              for document in @uniqueArray(@getCollection('pages').toJSON())
                li class: ('active' if @document.url == document.url), ->
                  a href: document.url, property: "dc:title", ->
                    document.title
      section id: "staff", class: "widget row", ->
        div class: "widget-container col-lg-12", ->
          div class: "widget-title", ->
            h3 ->
              text "Staff"
          div class: "widget-content", ->
            ul ->
              for author in @uniqueArray(@getCollection('authorPages').toJSON())
                li ->
                  a href: "/authors/"+author.title.toLowerCase(), ->
                    text author.title
      section id: "ads", class: "widget row", ->
        div class: "widget-container col-lg-12", ->
          div class: "widget-title", ->
            h3 ->
              text "Publicidad"
          div class: "widget-content", ->
            ins class:"adsbygoogle", style:"display:block", 'data-ad-client':"ca-pub-9661747922699028", 'data-ad-slot':"3506915392", 'data-ad-format':"auto"
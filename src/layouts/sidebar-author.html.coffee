---
layout: navbars
---

section id: "content", class: "container", ->
  div class: "row", ->
    div class: "col-lg-9", role: "main", ->
      div class: "container", ->
        text @content
      div class: "container", ->
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
      if @document.photo?
        section id: "photo", class: "widget", ->
          div class: "container", ->
            div class: "widget-title", ->
              h3 ->
                text @document.title
            div class: "widget-content", ->
              img class:"img-responsive img-rounded lazy", src: @getUrl("/img/placeholder.gif"), 'data-original': @document.photo[0], alt: @document.photo[1] if @document.photo[1]? or ""
              noscript ->
                img class:"img-responsive img-rounded", src: @document.photo[0], alt: @document.photo[1] if @document.photo[1]? or ""
      section id: "info", class: "widget", ->
        div class: "container", ->
          div class: "widget-title", ->
            h3 ->
              text "Acerca de " + @document.title
          div class: "widget-content", ->
            ul ->
              if @document.range?
                li ->
                  span class: "badge", ->
                    text @document.range
              if @document.realName?
                li ->
                  strong ->
                    text "Nombre: "
                  text @document.realName
              if @document.country?
                li ->
                  strong ->
                    text "País: "
                  text @document.country
              if @document.about?
                li ->
                  strong ->
                    text "Resumen: "
                  text @document.about
      if @document.expertIn?
        section id: "expertIn", class: "widget", ->
          div class: "container", ->
            div class: "widget-title", ->
              h3 ->
                text "Conocimientos"
            div class: "widget-content", ->
              ul ->
                for expert in @document.expertIn
                  li ->
                    text expert
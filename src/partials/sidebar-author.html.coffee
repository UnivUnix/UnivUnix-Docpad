aside id: "sidebar", class: "col-lg-3", role: "author", ->
  if @document.photo?
    section id: "photo", class: "widget", ->
      div class: "container", ->
        div class: "widget-title", ->
          h3 ->
            text @document.title
        div class: "widget-content", ->
          img class:"img-responsive img-rounded lazy", src: "/img/placeholder.gif", 'data-original': @document.photo[0], alt: @document.photo[1] if @document.photo[1]? or ""
          noscript ->
            img class:"img-responsive img-rounded", src: @document.photo[0], alt: @document.photo[1] if @document.photo[1]? or ""
  section id: "info", class: "widget", ->
    div class: "container", ->
      div class: "widget-title", ->
        h3 ->
          text "Acerca de " + @document.title
      div class: "widget-content", ->
        ul ->
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
aside id: "sidebar", class: "col-lg-3", role: "complementary", ->
  section id: "pages", class: "widget", ->
    div class: "container", ->
      div class: "widget-title", ->
        h3 ->
          text "Acerca de:"
      div class: "widget-content", ->
        ul ->
          for document in @getCollection('pages').toJSON()
            li class: ('active' if @document.url == document.url), ->
              a href: document.url, property: "dc:title", ->
                document.title
  section id: "ads", class: "widget", ->
    div class: "container", ->
      div class: "widget-title", ->
        h3 ->
          text "Publicidad"
      div class: "widget-content", ->
        text "Anuncio"
  section id: "staff", class: "widget", ->
    div class: "container", ->
      div class: "widget-title", ->
        h3 ->
          text "Staff"
      div class: "widget-content", ->
        ul ->
          text "Autor"
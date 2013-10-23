aside id: "sidebar", class: "col-sm-3 col-12 col-lg-3", role: "complementary", ->
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
  section id: "authors", class: "widget", ->
    div class: "container", ->
      div class: "widget-title", ->
        h3 ->
          text "Autores:"
      div class: "widget-content", ->
        ul ->
          for document in @getCollection('authors').toJSON()
            li class: ('active' if @document.url == document.url), ->
              a href: document.url, property: "dc:title", ->
                text document.title
                span class: "badge pull-right", ->
                  text ('Admin' if document.authorOrder == 1)
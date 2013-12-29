if @collection?
  if @getCollection(@collection).toJSON().length is 0
    div class:"panel panel-info", ->
      header class:"panel-heading", ->
        text "No hay artículos."
      section class:"panel-body", ->
        text "No se han encontrado artículos de "
        code @collection
        text " ."
  for document in (@getCollection(@collection).toJSON()[@document.page.startIdx...@document.page.endIdx])
    text @partial('article-link.html.coffee',@,{document: document})
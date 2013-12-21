if @collection?
  if @getCollection(@collection).toJSON().length is 0
    h1 ->
      text "No hay artículos."
    p ->
      text "No se han encontrado artículos de "
      code @collection
      text " ."
  for document in (@getCollection(@collection).toJSON()[@document.page.startIdx...@document.page.endIdx])
    text @partial('article-link.html.coffee',@,{document: document})
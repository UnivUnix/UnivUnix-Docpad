if @collection?
  if @getCollection(@collection).toJSON().length is 0
    h1 ->
      text "No hay artículos."
    p ->
      text "No se han encontrado artículos de la categoría "
      code @collection
      text " ."
  for document in (@getCollection(@collection).toJSON()[@document.page.startIdx...@document.page.endIdx])
    text @partial('article-link.html.coffee',@,{document: document})
if @tag?
  if @getCollection('posts').findAllLive({tags:$has:@tag}, [date:-1]).toJSON().length is 0
    h1 ->
      text "No hay artículos."
    p ->
      text "No se han encontrado artículos con el tag "
      code @tag
      text " ."
  for document in @getCollection('posts').findAllLive({tags:$has:@tag}, [date:-1]).toJSON()
    text @partial('article-link.html.coffee', @,{document: document})
if @collection?
  for document in (@getCollection(@collection).toJSON()[@document.page.startIdx...@document.page.endIdx])
    text @partial('article-link.html.coffee',@,{document: document})
if @tag?
  for document in @getCollection('posts').findAllLive({tags:$has:@tag}, [date:-1]).toJSON()
    text @partial('article-link.html.coffee', @,{document: document})
for document in (@getCollection(@collection).toJSON()[@document.page.startIdx...@document.page.endIdx])
  text @partial('article-link.html.coffee',@,{document: document})
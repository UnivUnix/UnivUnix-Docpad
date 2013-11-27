---
layout: sidebar
isPaged: true
pageSize: 6
dynamic: true
---

if @req.param("tag") is undefined
  h1 "Error: No ha especificado tag."
  p ->
    text "Parece que el documento que ha solicitado:"
    code @req.url 
    text "necesita de un parámetro adicional para su funcionamiento."
text @partial('article-list.html.coffee', @, {tag: @req.param("tag")})
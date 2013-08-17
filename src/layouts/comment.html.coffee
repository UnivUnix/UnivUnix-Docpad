---
layout: default
---

article class:"comment", ->
  h1 class:"comment-title", ->
    @document.title
  span class:"comment-author", ->
    @document.author
  a href:@getDatabase().get(@document.for)?.get('url'), class:"comment-for", ->
    @getDatabase().get(@document.for)?.get('title')
  div class:"comment-body", ->
    text @content
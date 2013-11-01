---
layout: wrap-9-3
title: 'Linux'
index: true
indexOrder: 2
isPaged: true
pagedCollection: 'linux'
pageSize: 10
---

for document in (@getCollection('linux').toJSON()[@document.page.startIdx...@document.page.endIdx])
  text @partial('article-link.html.coffee',@,{document: document})
if @hasPrevPage() || @hasNextPage()
  nav id: "post-nav", ->
    ul class: "pager", ->
      unless @hasPrevPage()
        li class: "disabled previous", ->
          a ->
            text "← Anteriores"
      else
          li class: "previous", ->
            a href: @getPrevPage(), ->
            text "← Anteriores"
      if !@hasNextPage()
        li class: "disabled next", ->
          a ->
            text "Nuevas →"
      else
          li class: "next", ->
            a href: @getNextPage(), ->
              text "Nuevas →"
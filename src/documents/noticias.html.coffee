---
layout: sidebar
title: 'Noticias'
isCategoryPage: true
categoryOrder: 1
isPaged: true
pagedCollection: 'noticias'
pageSize: 6
---

text @partial('article-list.html.coffee', @, {collection: 'noticias'})
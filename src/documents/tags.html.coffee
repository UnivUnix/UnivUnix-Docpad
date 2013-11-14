---
layout: wrap-9-3
dynamic: true
---

@getCollection('posts').findAllLive({tags:$has:@req.param("tag")}, [date:-1]).on('add', (document) ->
	document.setMetaDefaults(title: @req.param("tag") unless @req.param("tag") is undefined))
text @partial('article-list.html.coffee', @, {tag: @req.param("tag")})
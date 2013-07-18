---
layout: 'default'
isPaged: true
pagedCollection: 'posts'
pageSize: 10
---

for document in (@getCollection('posts').toJSON()[@document.page.startIdx...@document.page.endIdx])
  @partial('article-extract.html.coffee', document)
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
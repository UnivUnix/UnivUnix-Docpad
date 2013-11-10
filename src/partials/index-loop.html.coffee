for document in (@getCollection(@document.pagedCollection).toJSON()[@document.page.startIdx...@document.page.endIdx])
  text @partial('article-link.html.coffee', @, {document: document})
if @hasPrevPage() or @hasNextPage()
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
			unless @hasNextPage()
				li class: "disabled next", ->
					a ->
						text "Nuevas →"
			else
			    li class: "next", ->
			    	a href: @getNextPage(), ->
			    		text "Nuevas →"
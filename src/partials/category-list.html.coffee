i class: "glyphicon glyphicon-folder-open"
for webCategory in @getCollection('indexes').toJSON()
  if webCategory.title?
    if @categories.indexOf(webCategory.title.toLowerCase()) isnt -1
      a href: webCategory.url, ->
        text webCategory.title

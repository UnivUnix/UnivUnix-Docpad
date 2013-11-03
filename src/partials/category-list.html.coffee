for cat in @getCollection('indexes').toJSON()
  for doccat in @categories
    if cat.title?
      if cat.title.toLowerCase() == doccat
        a href: cat.url, ->
          i class: "glyphicon glyphicon-folder-open"
          text cat.title

---
layout: sidebar
---

article id: @document.id, class: "post", ->
  header class: "post-header", ->
    i class: "glyphicon glyphicon-calendar"
    time class: "updated", datetime: @postDate(@document.date, "html"), ->
      text @postDate(@document.date, "ue")
    i class: "glyphicon glyphicon-user"
    for author in @document.authors
      a class: "author", href: "/authors/" + author.toLowerCase(), ->
        text author
    i class: "glyphicon glyphicon-folder-open"
    for webCategory in @uniqueArray(@getCollection('categoryPages').toJSON())
      if webCategory.title?
        if @document.categories.indexOf(webCategory.title.toLowerCase()) isnt -1
          a href: webCategory.url, ->
            text webCategory.title
    
  section class: "post-content", ->
    h1 ->
      @document.title
    if @document.thumbnail?
      img src: @getUrl("/img/placeholder.gif"), 'data-original': @getThumbnail(@document.thumbnail[0], 'thumb'), class: "img-responsive lazy img-rounded pull-left", alt: @document.thumbnail[1] if @document.thumbnail[1]? or ""
      noscript ->
        img src: @getThumbnail(@document.thumbnail[0], 'thumb'), class: "img-responsive img-rounded pull-left", alt: @document.thumbnail[1] if @document.thumbnail[1]? or ""  
    text @content
    div class: "social-post", ->
      a class: "sprite sprite-share sprite-share-facebook", href: "http://www.facebook.com/sharer.php?u=" + @getUrl(@document.url) + "&amp;t=" + @formatURL(@document.title), target: "_blank", title: "Recomiéndalo en Facebook"
      a class: "sprite sprite-share sprite-share-twitter", href: "http://twitter.com/share?url=" + @getUrl(@document.url) + "&amp;text=" + @formatURL(@document.title) + "-&amp;via=UnivUnix", target: "_blank", title: "Compártelo en Twitter"
      a class: "sprite sprite-share sprite-share-google", href: "https://plus.google.com/share?url=" + @getUrl(@document.url), target: "_blank", title: "Compártelo en Google Plus"
      a class: "sprite sprite-share sprite-share-linkedin", href: "http://www.linkedin.com/shareArticle?mini=true&amp;url=" + @getUrl(@document.url) + "&amp;title=" + @formatURL(@document.title), target: "_blank", title: "Divulga el artículo en LinkedIn"
    div class: "tag-list", ->
      if @document.tags?
        for tag in @document.tags
          a class: "label label-primary", href: "/tags?tag=" + tag, ->
            i class: "glyphicon glyphicon-tag"
            text tag
    div id: "disqus_thread"
    noscript ->
      text "Please enable JavaScript to view the "
      a href: "http://disqus.com/?ref_noscript", ->
        text "comments powered by Disqus."
    a href: "http://disqus.com", class: "dsq-brlink", ->
      text "comments powered by "
      span class: "logo-disqus", ->
        text "Disqus"
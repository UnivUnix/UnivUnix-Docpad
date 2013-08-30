
article id: @document.id, class: "post hentry", ->
  header ->
    div class: "cats-align " + @getCategoryCss(@document.categories)
    h2 ->
      a href: @document.url, ->
        text @document.title
  div class: "entry-summary", ->
    if @document.thumbnail?
      img src: @getUrl("/img/placeholder.gif"), 'data-original': @getThumbnail(@getUrl(@document.thumbnail[0]), 'thumbnail'), class: "lazy img-responsive img-thumbnail pull-left", alt: @document.thumbnail[1] if @document.thumbnail[1]? or ""
      noscript ->
        img src: @getThumbnail(@getUrl(@document.thumbnail[0]), 'thumbnail'), class: "img-responsive img-thumbnail pull-left", alt: @document.thumbnail[1] if @document.thumbnail[1]? or ""
    div class: "post-content", ->
      text @getContentExtract(String(@document.contentRenderedWithoutLayouts)) + "..."
  footer ->
    div class: "container", ->
      div class: "pull-left", ->
        button type:"button", class:"btn btn-sm btn-default", ->
          i class: "glyphicon glyphicon-calendar"
          time class: "updated", datetime: @postDatetime(@document.date), ->
            text @postDate(@document.date)
        div class: "btn-group", ->
          button type:"button", class:"btn btn-sm btn-default", ->
            i class: "glyphicon glyphicon-folder-open"
          text @getCategoryPages(@document.categories)
        div class: "btn-group", ->
          a class:"btn btn-sm btn-default", href:@document.url + "#comments", ->
            i class: "glyphicon glyphicon-comment"
          a class: "btn btn-sm btn-default", href:@document.url + "#response", ->
            text @getTotalPostComments(@document)
      div class: "pull-right", ->
        div class:"btn-group", ->
          button type:"button", class:"btn btn-sm btn-default dropdown-toggle", 'data-toggle':"dropdown", ->
            i class: "glyphicon glyphicon-retweet"
            text "Compartir"
          div class: "dropdown-menu dropdown-padded pull-left", ->
            a class: "btn-tt", href: "http://twitter.com/share?url=" + @document.url + "&amp;text=" + @formatURL(@document.title) + "-&amp;via=UnivUnix", target: "_blank", title: "Compártelo en Twitter"
            a class: "btn-fb", href: "http://www.facebook.com/sharer.php?u=" + @document.url + "&amp;t=" + @formatURL(@document.title), target: "_blank", title: "Recomiéndalo en Facebook"
            a class: "btn-gp", href: "https://plus.google.com/share?url=" + @document.url, target: "_blank", title: "Compártelo en Google Plus"
            a class: "btn-lin", href: "http://www.linkedin.com/shareArticle?mini=true&amp;url=" + @document.url + "&amp;title=" + @formatURL(@document.title), target: "_blank", title: "Divulga el artículo en LinkedIn"
          a class: "btn btn-sm btn-default", href: @document.url, title: "Continuar leyendo", ->
            text "Continuar leyendo"
            i class: "glyphicon glyphicon-circle-arrow-right"
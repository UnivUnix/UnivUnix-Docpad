
article id: @document.id, class: "post hentry", ->
  header ->
    div class: "aligncategory " + @getCategoryCss(@document.categories)
    h2 ->
      a href: @document.url, ->
        text @document.title
  div class: "entry-summary", ->
    if @document.thumbnail?
      img src: @getUrl("/img/placeholder.gif"), 'data-original': @getThumbnail(@getUrl(@document.thumbnail[0])), class: "lazy alignthumb", alt: @document.thumbnail[1] if @document.thumbnail[1]? or ""
      noscript ->
        img src: @getThumbnail(@getUrl(@document.thumbnail[0])), class: "alignthumb", alt: @document.thumbnail[1] if @document.thumbnail[1]? or ""
    div class: "post-content", ->
      text @document.contentRenderedWithoutLayouts.slice(0,450) + "..."
  footer ->
    div class: "alignleft", ->
      i class: "icon-calendar icon-white"
      time class: "updated", datetime: @postDatetime(@document.date), ->
        text @postDate(@document.date)
      i class: "icon-folder-open icon-white"
      text @getCategoryPages(@document.categories)
      i class: "icon-comment icon-white"
    div class: "dropdown all-camera-dropdown alignleft", ->
      i class: "icon-plus-sign icon-white"
      a class: "dropdown-toggle", 'data-toggle': "dropdown", href:"#share", ->
        text "Compartir"
      div class: "dropdown-menu", style: "padding:10px", ->
        a class: "twitter", href: "http://twitter.com/share?url=" + @document.url + "&amp;text=" + @document.title + "-&amp;via=UnivUnix", target: "_blank", title: "Compártelo en Twitter"
        a class: "facebook", href: "http://www.facebook.com/sharer.php?u=" + @document.url + "&amp;t=" + @document.title, target: "_blank", title: "Recomiéndalo en Facebook"
        a class: "gplus", href: "https://plus.google.com/share?url=" + @document.url, target: "_blank", title: "Compártelo en Google Plus"
        a class: "linkedin", href: "http://www.linkedin.com/shareArticle?mini=true&amp;url=" + @document.url + "&amp;title=" + @document.title, target: "_blank", title: "Divulga el artículo en LinkedIn"
    div class: "alignrightfixed", ->
      a class: "btn btn-small btn-info", href: @document.url, title: "Continuar leyendo", ->
        text "Leer entrada completa"
        i class: "icon-circle-arrow-right icon-white"
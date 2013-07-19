---
cacheable: true
---

article id: @id, class: "post hentry", ->
  header ->
    div class: "aligncategory " + @getCssCategory(@categories)
    h2 ->
      a href: @url, ->
        text @title
  div class: "entry-summary", ->
    img src: @getUrl("/img/placeholder.gif"), 'data-lazy-type': "image", 'data-lazy-src': "", class: "lazy lazy-hidden alignthumb", alt: ""
    noscript ->
      img src: "", class: "alignthumb", alt: ""
    div class: "post-content", ->
      text @content
  footer ->
    div class: "alignleft", ->
      i class: "icon-calendar icon-white"
      time class: "updated", datetime: @postDatetime(@date), ->
        text @postDate(@date)
      i class: "icon-folder-open icon-white"
        
      i class: "icon-comment icon-white"
    div class: "dropdown all-camera-dropdown alignleft", ->
      i class: "icon-plus-sign icon-white"
      a class: "dropdown-toggle", 'data-toggle': "dropdown", href:"#share", ->
        text "Compartir"
      div class: "dropdown-menu", style: "padding:10px", ->
        a class: "twitter", href: "http://twitter.com/share?url=" + @url + "&amp;text=" + @title + "-&amp;via=UnivUnix", target: "_blank", title: "Compártelo en Twitter"
        a class: "facebook", href: "http://www.facebook.com/sharer.php?u=" + @url + "&amp;t=" + @title, target: "_blank", title: "Recomiéndalo en Facebook"
        a class: "gplus", href: "https://plus.google.com/share?url=" + @url, target: "_blank", title: "Compártelo en Google Plus"
        a class: "linkedin", href: "http://www.linkedin.com/shareArticle?mini=true&amp;url=" + @url + "&amp;title=" + @title, target: "_blank", title: "Divulga el artículo en LinkedIn"
    div class: "alignrightfixed", ->
      a class: "btn btn-small btn-info", href: @url, title: "Continuar leyendo", ->
        text "Leer entrada completa"
        i class: "icon-circle-arrow-right icon-white"
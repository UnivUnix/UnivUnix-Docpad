---
layout: default
---

article id: @document.id, class: "post hentry", ->
  header ->
    h2 ->
      @document.title
  div class: "entry-content", ->
    if @document.thumbnail?
      img src: @getUrl("/img/placeholder.gif"), 'data-original': @getThumbnail(@document.thumbnail[0], 'medium'), class: "lazy alignthumb", alt: @document.thumbnail[1] if @document.thumbnail[1]?
      noscript ->
        img src: @getThumbnail(@document.thumbnail[0], 'medium'), class: "alignthumb", alt: @document.thumbnail[1] if @document.thumbnail[1]?
    div class: "content-post", ->
      text @content
  footer ->
    div ->
      div class: "alignleft", ->
        i class: "icon-calendar icon-white"
        time class: "updated", datetime: @postDatetime(@document.date), ->
          text @postDate(@document.date)
        i class: "icon-folder-open icon-white"
        text @getCategoryPages(@document.categories)
        i class: "icon-comment icon-white"
        text @getTotalPostComments()
      div class: "dropdown all-camera-dropdown", ->
        i class: "icon-plus-sign icon-white"
        a class: "dropdown-toggle", 'data-toggle': "dropdown", href:"#share", ->
          text "Compartir"
        div class: "dropdown-menu", style: "padding:10px", ->
          a class: "twitter", href: "http://twitter.com/share?url=" + @document.url + "&amp;text=" + @formatURL(@document.title) + "-&amp;via=UnivUnix", target: "_blank", title: "Compártelo en Twitter"
          a class: "facebook", href: "http://www.facebook.com/sharer.php?u=" + @document.url + "&amp;t=" + @formatURL(@document.title), target: "_blank", title: "Recomiéndalo en Facebook"
          a class: "gplus", href: "https://plus.google.com/share?url=" + @document.url, target: "_blank", title: "Compártelo en Google Plus"
          a class: "linkedin", href: "http://www.linkedin.com/shareArticle?mini=true&amp;url=" + @document.url + "&amp;title=" + @formatURL(@document.title), target: "_blank", title: "Divulga el artículo en LinkedIn"
text @getCommentsBlock()

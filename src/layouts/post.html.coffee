---
layout: wrap-9-3
---

article id: @document.id, class: "post hentry", ->
  header ->
    h2 ->
      @document.title
  div class: "entry-content", ->
    if @document.thumbnail?
      a href:@getUrl(@document.thumbnail[0]), ->
        img src: @getUrl("/img/placeholder.gif"), 'data-original': @getThumbnail(@document.thumbnail[0], 'medium'), class: "lazy img-responsive img-rounded pull-left", alt: @document.thumbnail[1] if @document.thumbnail[1]?
      noscript ->
        a href:@getUrl(@document.thumbnail[0]), ->
          img src: @getThumbnail(@document.thumbnail[0], 'medium'), class: "img-responsive img-rounded pull-left", alt: @document.thumbnail[1] if @document.thumbnail[1]?
    div class: "content-post", ->
      text @content
  footer ->
    div class:"container", ->
      div class: "pull-left", ->
        button type:"button", class:"btn btn-sm btn-default", ->
          i class: "glyphicon glyphicon-calendar"
          time class: "updated", datetime: @postDatetime(@document.date), ->
            text @postDate(@document.date)
        div class: "btn-group", ->
          button type:"button", class:"btn btn-sm btn-default", ->
            i class:"glyphicon glyphicon-user"
          text @getAuthorsPages(@document.authors)
        div class:"btn-group", ->
          button type:"button", class:"btn btn-sm btn-default", ->
            i class: "glyphicon glyphicon-folder-open"
          text @getCategoryPages(@document.categories)
        div class:"btn-group", ->
          button type:"button", class:"btn btn-sm btn-default", ->
            i class: "glyphicon glyphicon-comment"
          a href:"#disqus_thread", class:"btn btn-sm btn-default", ->
            text "-"
      div class: "dropdown all-camera-dropdown pull-right", ->
        button type:"button", class:"btn btn-sm btn-default dropdown-toggle", 'data-toggle':"dropdown", ->
          i class: "glyphicon glyphicon-retweet"
          text "Compartir"
        div class: "dropdown-menu dropdown-padded pull-left", ->
          a class: "btn-tt", href: "http://twitter.com/share?url=" + @document.url + "&amp;text=" + @formatURL(@document.title) + "-&amp;via=UnivUnix", target: "_blank", title: "Compártelo en Twitter"
          a class: "btn-fb", href: "http://www.facebook.com/sharer.php?u=" + @document.url + "&amp;t=" + @formatURL(@document.title), target: "_blank", title: "Recomiéndalo en Facebook"
          a class: "btn-gp", href: "https://plus.google.com/share?url=" + @document.url, target: "_blank", title: "Compártelo en Google Plus"
          a class: "btn-lin", href: "http://www.linkedin.com/shareArticle?mini=true&amp;url=" + @document.url + "&amp;title=" + @formatURL(@document.title), target: "_blank", title: "Divulga el artículo en LinkedIn"
div id:"disqus_thread"
script type:"text/javascript", ->
  text 'var disqus_shortname="univunix";(function(){var e=document.createElement("script");e.type="text/javascript";e.async=true;e.src="//"+disqus_shortname+".disqus.com/embed.js";(document.getElementsByTagName("head")[0]||document.getElementsByTagName("body")[0]).appendChild(e)})()'
noscript ->
  text "Please enable JavaScript to view the "
  a href:"http://disqus.com/?ref_noscript", ->
    text "comments powered by Disqus."
a href:"http://disqus.com", class:"dsq-brlink", ->
  text "comments powered by "
  span class:"logo-disqus", ->
    text "Disqus"
  
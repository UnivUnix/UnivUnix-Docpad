
article id: @document.id, class: "col-sm-6 separator", ->
  div class:"thumbnail", ->
    #if @document.thumbnail?
     # img src: @getUrl("/img/placeholder.gif"), 'data-original': @getThumbnail(@getUrl(@document.thumbnail[0])), 'thumbnail'), class:"lazy img-responsive", alt: @document.thumbnail[1] if @document.thumbnail[1]? or ""
      #noscript ->
       # img src: @getThumbnail(@getUrl(@document.thumbnail[0]), 'thumbnail'), class:"img-responsive", alt: @document.thumbnail[1] if @document.thumbnail[1]? or ""
    # else
      # img src: @getUrl("img/placeholder.gif"), 'data-original': @getThumbnail(@getUrl("img/placeholder.gif"), 'thumbnail'), class:"lazy img-responsive", alt:"No thumbnail"
      # noscript ->
        # img src: @getThumbnail(@getUrl("img/placeholder.gif"), 'thumbnail'), class:"img-responsive", alt:"No thumbnail"  
    header class:"caption", ->
      h3 ->
        a href: @document.url, ->
          text @document.title
      p ->
        text @getCategoryPages(@document.categories)
    footer ->
      div class:"text-center", ->
        button type:"button", class:"btn btn-sm btn-default", ->
          i class:"glyphicon glyphicon-calendar"
          time class:"updated" datetime: @postDatetime(@document.date), ->
            text @postDate(@document.date)
        div class:"btn-group", ->
          a class:"btn btn-sm btn-default", href: @document.url + "#comments", ->
            i class:"glyphicon glyphicon-comment"
          a class:"btn btn-sm btn-default", href: @document.url + "#disqus_thread", ->
            text "-"
          button type:"button", class:"btn btn-sm btn-default dropdown-toggle", 'data-toggle':"dropdown", ->
            i class:"glyphicon glyphicon-retweet"
            text "Compartir"
          div class:"dropdown-menu dropdown-padded pull-right" 

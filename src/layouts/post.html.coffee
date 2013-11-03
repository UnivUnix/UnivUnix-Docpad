---
layout: wrap-9-3
---

article id: @document.id, class: "post", ->
  header class: "post-header"
  section class: "post-content", ->
    h1 ->
      @document.title
    text @content
    div class: "social-post", ->
      a class: "sprite sprite-share sprite-share-facebook", href: "http://www.facebook.com/sharer.php?u=" + @document.url + "&amp;t=" + @formatURL(@document.title), target: "_blank", title: "Recomiéndalo en Facebook"
      a class: "sprite sprite-share sprite-share-twitter", href: "http://twitter.com/share?url=" + @document.url + "&amp;text=" + @formatURL(@document.title) + "-&amp;via=UnivUnix", target: "_blank", title: "Compártelo en Twitter"
      a class: "sprite sprite-share sprite-share-google", href: "https://plus.google.com/share?url=" + @document.url, target: "_blank", title: "Compártelo en Google Plus"
      a class: "sprite sprite-share sprite-share-linkedin", href: "http://www.linkedin.com/shareArticle?mini=true&amp;url=" + @document.url + "&amp;title=" + @formatURL(@document.title), target: "_blank", title: "Divulga el artículo en LinkedIn"
    div class: "tag-list"
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

  
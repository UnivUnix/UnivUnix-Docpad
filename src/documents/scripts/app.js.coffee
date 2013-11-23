$(document).ready ->
  $('img.lazy').show().lazyload({
  	effect: "slideDown"
  	failureLimit: 6
  })
disqus_shortname = "univunix"
(->
  s = document.createElement("script")
  s.async = true
  s.type = "text/javascript"
  s.src = "//" + disqus_shortname + ".disqus.com/count.js"
  (document.getElementsByTagName("HEAD")[0] or document.getElementsByTagName("BODY")[0]).appendChild s
)()
(->
  dsq = document.createElement('script')
  dsq.type = 'text/javascript'
  dsq.async = true
  dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js'
  (document.getElementsByTagName('head')[0] or document.getElementsByTagName('body')[0]).appendChild dsq
)()
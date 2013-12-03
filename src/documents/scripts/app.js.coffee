disqus_shortname = "univunix"
(->
  s = document.createElement("script")
  s.async = true
  s.type = "text/javascript"
  s.src = "//" + disqus_shortname + ".disqus.com/count.js"
  (document.getElementsByTagName("HEAD")[0] or document.getElementsByTagName("BODY")[0]).appendChild s
)()
(->
  list = document.getElementsByTagName("div")
  divfound = false
  for element in list
    if element.getAttribute("id") is "disqus_thread"
      divfound = true
  if divfound is true
    dsq = document.createElement('script')
    dsq.type = 'text/javascript'
    dsq.async = true
    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js'
    (document.getElementsByTagName('head')[0] or document.getElementsByTagName('body')[0]).appendChild dsq
)()
$(document).ready ->
  $('#content').css("display","none")
  $('#content').fadeIn("slow")
  $("a").click((event) ->
    event.preventDefault()
    linkLocation = this.href
    $('#content').fadeOut("slow", redirectPage(linkLocation))
  )
  redirectPage=(linkLocation) ->
    window.location = linkLocation
  $('img.lazy').show().lazyload({
  	effect: "slideDown"
  	failureLimit: 6
  })
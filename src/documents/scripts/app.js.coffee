$(document).ready ->
  $('img.lazy').show().lazyload({
  	effect: "slideDown"
  	failureLimit: 10
  })
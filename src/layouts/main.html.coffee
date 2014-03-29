doctype 5
html lang:"es",->
  head ->
    title @getPreparedTitle()
    meta charset:"utf-8"
    meta "http-equiv":"content-type","content":"text/html; charset=utf-8"
    meta "name":"description","content":@getPreparedDescription()
    
    ie "lt IE 9", ->
      meta "http-equiv": "X-UA-Compatible", "content": "IE=edge,chrome=1"
    
    if @getPreparedKeywords() != ""
      meta "name": "keywords", "content": @getPreparedKeywords()
    meta "name": "viewport", "content": "width=device-width, initial-scale=0.9, maximum-scale=0.9, user-scalable=no"

    link rel: "shortcut icon",                href: "/icons/favicon.png"
    link rel: "apple-touch-icon",             href: "/icons/apple-icon.png"
    
    ie "lt IE 9", ->
      script async: yes, src: "http://html5shim.googlecode.com/svn/trunk/html5.js"
    text @getBlock('styles').add(@site.styles).toHTML()

  body ->
    text @content
    text @getBlock('scripts').add(@site.scripts).toHTML()

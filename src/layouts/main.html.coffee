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
    meta "name": "viewport", "content": "width=device-width, initial-scale=1.0"

    link rel: "shortcut icon",                href: "/icons/favicon.png"
    link rel: "apple-touch-icon",             href: "/icons/apple-icon.png"
    
    ie "lt IE 9", ->
      script async: yes, src: "http://html5shim.googlecode.com/svn/trunk/html5.js"
    text @getBlock('styles').add(@site.styles).toHTML()

  body ->
    text @content
    text @getBlock('scripts').add(@site.scripts).toHTML()
    script type: "text/javascript", ->
      text '''var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-37637477-1']);
      _gaq.push(['_setDomainName', 'univunix.com']);
      _gaq.push(['_trackPageview']);'''
    script src:"/scripts/cookietool.js"
    script type:"text/javascript",->
      text '''CookieTool.Config.set('link','http://www.univunix.com/lssi.html');
      CookieTool.API.impliedAgreement();'''

htmlToText = require('html-to-text')

# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

  # =================================
  # Server configuration
  port: 9000

  # =================================
  # Template Data
  # These are variables that will be accessible via our templates
  # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

  templateData:

    # Specify some site properties
    site:
      # The production url of our website
      url: "http://www.univunix.com"

      # The default title of our website
      title: "UnivUnix"
      titleComplement: "El portal unificado de Unix y Linux."

      # The website description (for SEO)
      description: """
        Una web donde te pondremos al día en la información que rodea a Linux y derivados de Unix: noticias, tutoriales y software variado e interesante.
        """

      # Styles
      styles: [
        "/styles/bootstrap.css"
      ]

      # Scripts
      scripts: [
        "/scripts/jquery-min.js",
        "/scripts/lazyload-min.js",
        "/scripts/bootstrap-min.js",
        "/scripts/cookietool.js",
        "/scripts/app.js"
      ]

    # -----------------------------
    # Helper Functions

    # Get the prepared site/document title
    # Often we would like to specify particular formatting to our page's title
    # we can apply that formatting here
    getPreparedTitle: ->
      # if we have a document title, then we should use that and suffix the site's title onto it
      if @document.title
        "#{@document.title} | #{@site.title}"
      # if our document does not have it's own title, then we should just use the site's title
      else
        "#{@site.title} | #{@site.titleComplement}"

    # Get the prepared site/document description
    getPreparedDescription: ->
      #if we have a document description, then we should use that, otherwise use the site's description
      if @document.isCategoryPage is true or @document.isAuthorPage is true or not @document.title?
        @site.description
      else
        @getPostExtract(String(@document.contentRenderedWithoutLayouts))

    # Get the prepared site/document keywords
    getPreparedKeywords: ->
      # Merge the document keywords with the site keywords
      @site.keywords.concat(@document.keywords or []).join(', ')
      
    #--------------------------------
    # Custom functions

    getUrl: (document) ->
      return @site.url+document

    getPostExtract: (content) ->
      i = content.search('</p>')
      if i >= 0
        htmlToText.fromString content[0..i+3]             
      else
        htmlToText.fromString content

    formatURL: (url) ->
      url.replace(/\s/g, "%20")

    isPageCategory: (categories, indexTitle) ->
      if categories?
        for cat in categories
          if indexTitle?
            if indexTitle.toLowerCase() == cat
              return true
      return false
      
    uniqueArray: (origArray) ->
      resArray = []
      origLength = origArray.length
      x = 0
      while x < origLength
        found = undefined
        y = 0
        while y < resArray.length
          if origArray[x].title is resArray[y].title
            found = true
            break
          y++
        origArray[x].url = origArray[x].url.replace(/\.(\d)+/, "") 
        resArray.push origArray[x] unless found
        x++
      resArray

  # =================================
  # Collections
  # These are special collections that our website makes available to us
  
  collections:

    # Main collections
    # ---------------------------------------
    pages: (database) ->
      database.findAllLive({isPage: true}, [pageOrder:1,title:1])

    categoryPages: (database) ->
      database.findAllLive({isCategoryPage: true}, [categoryOrder:1, title: 1])

    authorPages: (database) ->
      database.findAllLive({isAuthorPage: true}, [authorOrder:1, title: 1])

    posts: (database) ->
      database.findAllLive({categories:$exists:true}, [date:-1])

    # Author collections
    # ---------------------------------------
    aglezabad: ->
      @getCollection('posts').findAllLive({authors:$has:'Aglezabad'}, [date:-1])

    ferthedems: ->
      @getCollection('posts').findAllLive({authors:$has:'Ferthedems'}, [date:-1])

    kennynnek: ->
      @getCollection('posts').findAllLive({authors:$has:'Kennynnek'}, [date:-1])

    # Category collections
    # ---------------------------------------      
    arch: ->
      @getCollection('posts').findAllLive({categories:$has:'arch'}, [date:-1])

    debian: ->
      @getCollection('posts').findAllLive({categories:$has:'debian'}, [date:-1])

    fedora: ->
      @getCollection('posts').findAllLive({categories:$has:'fedora'}, [date:-1])

    linux: ->
      @getCollection('posts').findAllLive({categories:$has:'linux'}, [date:-1])
    
    mageia: ->
      @getCollection('posts').findAllLive({categories:$has:'mageia'}, [date:-1])

    mint: ->
      @getCollection('posts').findAllLive({categories:$has:'mint'}, [date:-1])

    noticias: ->
      @getCollection('posts').findAllLive({categories:$has:'noticias'}, [date:-1])

    opensuse: ->
      @getCollection('posts').findAllLive({categories:$has:'opensuse'}, [date:-1])

    programacion: ->
      @getCollection('posts').findAllLive({categories:$has:'programación'}, [date:-1])

    sabayon: ->
      @getCollection('posts').findAllLive({categories:$has:'sabayon'}, [date:-1])

    tutoriales: ->
      @getCollection('posts').findAllLive({categories:$has:'tutoriales'}, [date:-1])

    ubuntu: ->
      @getCollection('posts').findAllLive({categories:$has:'ubuntu'}, [date:-1])

  # =================================
  # Plugins

  # =================================
  # DocPad Events

  # Here we can define handlers for events that DocPad fires
  # You can find a full listing of events on the DocPad Wiki
  events:

    # Server Extend
    # Used to add our own custom routes to the server before the docpad routes are added
    serverExtend: (opts) ->
      # Extract the server from the options
      {server} = opts
      docpad = @docpad

      # As we are now running in an event,
      # ensure we are using the latest copy of the docpad configuraiton
      # and fetch our urls from it
      latestConfig = docpad.getConfig()
      oldUrls = latestConfig.templateData.site.oldUrls or []
      newUrl = latestConfig.templateData.site.url

      # Redirect any requests accessing one of our sites oldUrls to the new site url
      server.use (req,res,next) ->
        if req.headers.host in oldUrls
          res.redirect(newUrl+req.url, 301)
        else
          next()

  # =====================================
  # Enviroments: development, production.
  # Use docpad -e <enviroment> to select.

  plugins:
    livereload:
      enabled: false
    moment:
      formats: [
        {raw: 'date', format: 'YYYY-MM-DD', formatted: 'computerDate'}
        {raw: 'date', format: 'DD/MM/YYYY', formatted: 'humanDate'}
        {raw: 'date', format: 'ddd, DD MMM YYYY HH:mm:ss ZZ', formatted: 'rfcDate'}
      ]
    sitemap:
      cachetime: 600000
      changefreq: 'weekly'
      priority: 0.5
    thumbnails:
      imageMagick: true
      presets:
        'thumbnail':
          w: 700
          h: 440
        'thumb':
          w: 250
          h: 250
      targets:
        'thumbnail': (img,args) ->
          return img
            .resize(700)
            .crop(700, 440)
        'thumb': (img, args) ->
          return img
            .resize(250,250)
            .crop(250,250)
}

# Export our DocPad Configuration
module.exports = docpadConfig
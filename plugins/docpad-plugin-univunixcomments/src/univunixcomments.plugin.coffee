# Export
module.exports = (BasePlugin) ->
  # Define
  class UnivunixCommentsPlugin extends BasePlugin
    # Name
    name: 'univunixcomments'

    # Config
    config:
      collectionName: 'comments'
      relativeDirPath: 'comments'
      postUrl: '/comment'
      extension: '.html.md'
      
    # Extend Template Data
    # Add our form to our template data
    extendTemplateData: ({templateData}) ->
      # Prepare
      plugin = @
      docpad = @docpad

      # getCommentsBlock
      templateData.getCommentsBlock = ->
        @referencesOthers()
        return @partial('comments-area.html.coffee', @)

      # getComments
      templateData.getComments = ->
        return docpad.getCollection(plugin.getConfig().collectionName).findAll(for: @document.relativeBase)

      # Chain
      @


    # Extend Collections
    # Create our live collection for our comments
    extendCollections: ->
      # Prepare
      config = @getConfig()
      docpad = @docpad
      database = docpad.getDatabase()

      # Create the collection
      comments = database.findAllLive({relativeDirPath: $startsWith: config.relativeDirPath}, [date:-1])

      # Set the collection
      docpad.setCollection(config.collectionName, comments)

      # Chain
      @


    # Server Extend
    # Add our handling for posting the comment
    serverExtend: (opts) ->
      # Prepare
      {server} = opts
      plugin = @
      docpad = @docpad
      database = docpad.getDatabase()

      # Comment Handing
      server.all @getConfig().postUrl, (req,res,next) ->
        # Prepare
        config = plugin.getConfig()
        now = new Date(req.body.date or null)
        nowTime = now.getTime()
        nowString = now.toString()
        redirect = req.body.redirect ? req.query.redirect ? 'back'

        # Prepare
        documentAttributes =
          data: req.body.body or ''
          meta:
            title: req.body.title or "Comment at #{nowString}"
            for: req.body.for or ''
            author: req.body.author or ''
            date: now
            fullPath: docpad.config.documentsPaths[0]+"/#{config.relativeDirPath}/#{nowTime}#{config.extension}"

        # Create document from attributes
        document = docpad.createDocument(documentAttributes)

        # Inject helper
        config.injectDocumentHelper?.call(me, document)

        # Add it to the database
        database.add(document)

        # Listen for regeneration
        docpad.once 'generateAfter', ->
          # Check
          # return next(err)  if err

          # Update browser
          if redirect is 'back'
            res.redirect('back')
          else if redirect is 'document'
            res.redirect(document.get('url'))
          else
            res.json(documentAttributes)

          # No need to call next here as res.send/redirect will do it for us

        # Write source which will trigger the regeneration
        document.writeSource {cleanAttributes:true}, (err) ->
          # Check
          return next(err)  if err

      # Done
      @

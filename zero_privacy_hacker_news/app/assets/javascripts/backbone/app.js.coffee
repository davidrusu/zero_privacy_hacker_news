@App = do (Backbone, Marionette) ->
        App = new Marionette.Application
        App.addRegions
                headerRegion: "#header-region"
                mainRegion: "#main-region"
                footerRegion: "#footer-region"
        
        console.log "app"
        
        App.on "initialize:after", ->
                if Backbone.history
                        Backbone.history.start()
       
#        App.Router = new Router(controller: new Controller)
#        Backbone.history.start(pushState: true)
 
        App

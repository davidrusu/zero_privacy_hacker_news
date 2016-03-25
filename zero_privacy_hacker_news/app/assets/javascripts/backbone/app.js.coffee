@App = do (Backbone, Marionette) ->
        App = new Marionette.Application

        App.addRegions
                headerRegion: "#header-region"
                mainRegion: "#main-region"
                footerRegion: "#footer-region"
        
        Backbone.history.start()
        App

@App.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
        API =
          showHeader: -> HeaderApp.Show.Controller.showHeader()
        console.log "headeaapp"
        HeaderApp.on "start", -> API.showHeader()

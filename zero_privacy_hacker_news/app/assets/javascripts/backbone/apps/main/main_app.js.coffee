@App.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
        API =
          showMain: -> MainApp.Show.Controller.showMain()
        console.log "main app"
        MainApp.on "start", -> API.showMain()

@App.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
        MainApp.on "start", -> MainApp.Show.Controller.showMain()

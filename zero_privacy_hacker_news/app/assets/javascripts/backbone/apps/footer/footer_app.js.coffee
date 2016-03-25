@App.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
        API =
          showFooter: -> FooterApp.Show.Controller.showFooter()
        FooterApp.on "start", -> API.showFooter()

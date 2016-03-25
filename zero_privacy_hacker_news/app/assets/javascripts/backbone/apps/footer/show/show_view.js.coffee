App.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    Show.Controller = 
        showFooter: ->
            footerView = @getFooterView()
            App.footerRegion.show footerView

        getFooterView: ->
            new Show.Footer

    class Show.Footer extends Marionette.ItemView
        template: "<p> This is a footer </p>"

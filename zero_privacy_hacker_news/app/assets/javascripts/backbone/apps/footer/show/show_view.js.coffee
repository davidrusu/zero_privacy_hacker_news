App.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    Show.Controller = 
        showFooter: ->
            footerView = @getFooterView()
            App.footerRegion.show footerView

        getFooterView: ->
            new Show.Footer

    console.log "This is footerapp.show"

    class Show.Footer extends Marionette.ItemView
        template: "<p> This is a footer </p>"

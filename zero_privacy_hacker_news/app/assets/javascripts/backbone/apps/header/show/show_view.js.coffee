App.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    Show.Controller = 
        showHeader: ->
            headerView = @getHeaderView()
            App.headerRegion.show headerView

        getHeaderView: ->
            new Show.Header

    console.log "This is headerapp.show"

    class Show.Header extends Marionette.ItemView
        template: "<div> This is a header </p>"

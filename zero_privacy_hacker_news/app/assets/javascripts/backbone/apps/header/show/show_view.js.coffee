App.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    Show.Controller = 
        showHeader: ->
            headerView = @getHeaderView()
            App.headerRegion.show headerView

        getHeaderView: ->
            new Show.Header

    class Show.Header extends Marionette.ItemView
        template: "
                <span>
                  <div id=\"hn_logo\">Y</div>
                  <a id=\"hn_name\" href='/'>Hacker News</div>
                </span>
                "

App.module "MainApp.Show", (Show, App, Backbone, Marionette, $, _) ->

    Show.Controller =
        showMain: ->
            mainView = @getMainView()
            App.mainRegion.show mainView
            
        getMainView: ->
            stories = new App.Model.Stories
            main = new Show.Main collection: stories
            main.collection.fetch() # load the top stories from HN
            
            main

    class Show.Story extends Marionette.ItemView
            className: "story"
            template: (model) ->
                "
                <div class=\"story_title\">
                  <a href=\"#{model.url}\"> #{model.title} </a>
                </div>
                <button class=\"story_author\">
                  #{model.by}
                </button>
                "

    class Show.Main extends Marionette.CollectionView
        childView: Show.Story
        collectionEvents:
                "sync": "render"


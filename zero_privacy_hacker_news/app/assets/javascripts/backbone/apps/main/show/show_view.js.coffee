App.module "MainApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    TOP_STORIES_URL = "https://hacker-news.firebaseio.com/v0/topstories.json"
    ITEM_URL = "https://hacker-news.firebaseio.com/v0/item/"
    NUM_SHOWN = 10

    Show.Controller =
        showMain: ->
            mainView = @getMainView()
            App.mainRegion.show mainView
            

        getMainView: ->
            stories = new Show.StoriesModel
            main = new Show.Main collection: stories
            
            main.collection.fetch()
            main

    console.log "This is mainapp.show"

    class Show.StoryModel extends Backbone.Model
            url: () -> ITEM_URL + @id + ".json"

            initialize: (id) ->
                    @id id
                    @fetch() # fetch the story with this id
            
            id: (id) -> @set id: id


    class Show.StoriesModel extends Backbone.Collection
            url: TOP_STORIES_URL
            model: Show.StoryModel
            parse: (data) ->
                    _.take(data, NUM_SHOWN)

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


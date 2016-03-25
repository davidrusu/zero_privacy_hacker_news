

App.module "MainApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    TOP_STORIES_URL = "https://hacker-news.firebaseio.com/v0/topstories.json"
    ITEM_URL = "https://hacker-news.firebaseio.com/v0/item"
    NUM_SHOWN = 10

    Show.Controller =
        showMain: ->
            mainView = @getMainView()
            App.mainRegion.show mainView
            

        getMainView: ->
            posts = new Show.PostsModel
            posts.add new Show.PostModel 1
            main = new Show.Main collection: posts
            
            main.collection.add new Show.PostModel 2
            main.collection.fetch()
            main

    console.log "This is mainapp.show"

    class Show.PostModel extends Backbone.Model
            url: () ->
                    u = ITEM_URL + "/" + @id + ".json"
                    console.log u
                    u

            initialize: (id) ->
                    console.log id
                    @id id
                    @fetched = true
                    @fetch()
        
            fetched: false
            
            id: (id) -> @set id: id


    class Show.PostsModel extends Backbone.Collection
            url: TOP_STORIES_URL
            model: Show.PostModel
            parse: (data) ->
                    _.take(data, NUM_SHOWN)

    class Show.Post extends Marionette.ItemView
            template: (model) ->
                "
                <div class=\"post_title\">
                  <a href=\"#{model.url}\"> #{model.title} </a>
                </div>
                <div class=\"post_author\">
                  #{model.by}
                </div>
                "

    class Show.Main extends Marionette.CollectionView
        childView: Show.Post
        collectionEvents:
                "sync": "render"


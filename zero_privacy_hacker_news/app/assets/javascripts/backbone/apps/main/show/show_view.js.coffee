

App.module "MainApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    TOP_STORIES_URL = "https://hacker-news.firebaseio.com/v0/topstories.json"
    Show.Controller =
        showMain: ->
            mainView = @getMainView()
            App.mainRegion.show mainView
            

        getMainView: ->
            posts = new Show.PostsModel
            posts.add new Show.PostModel 1
            main = new Show.Main collection: posts
            
            main.collection.add new Show.PostModel 2
            main.collection.fetch
            main

    console.log "This is mainapp.show"

    class Show.PostModel extends Backbone.Model
            initialize: (id) -> @id id
            
            id: (id) -> @set id: id

    class Show.PostsModel extends Backbone.Collection
            url: TOP_STORIES_URL
            model: Show.PostModel

    class Show.Post extends Marionette.ItemView
            template: (model) -> "<p> item #{model.id} </p>"



    class Show.Main extends Marionette.CollectionView
        childView: Show.Post
        collectionEvents:
                "sync": "render"

    
                

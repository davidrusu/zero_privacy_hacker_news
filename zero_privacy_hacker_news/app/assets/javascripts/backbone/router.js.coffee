App.module "Router", (Router, App, Backbone, Marionette, _) ->
    class Router extends Backbone.Router
        routes:
            "story/:id": "loadStory"
            "": "mainPage"
        loadStory: (id) ->
            story = new App.Model.Story id, false
            story.fetch success: -> 
                App.Model.currentStory = story
                App.Model.currentComments = new App.Model.Comments (story.get "kids"), false
                App.Model.currentComments.map (comment) -> comment.fetch success: ->
                    App.StoryApp.Show.Controller.showStory()
            
        mainPage: ->
            App.mainRegion.show new App.MainApp
        
    App.router = new Router

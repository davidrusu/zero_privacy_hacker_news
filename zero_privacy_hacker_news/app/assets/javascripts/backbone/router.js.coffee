App.module "Router", (Router, App, Backbone, Marionette, _) ->
    class Router extends Backbone.Router
        routes:
            "story/:id": "loadStory"
            "user/:user": "loadUser"
            "": "mainPage"
        
        loadStory: (id) ->
            console.log 'routing to story page'
            story = new App.Model.Story id, false
            story.fetch success: -> 
                App.StoryApp.API.showStory(story)

        loadUser: (user) ->
            console.log "routing to user page"
            user = new App.Model.User user
            App.UserApp.API.showUser user

        mainPage: ->
            console.log 'routing to main page'
            App.MainApp.trigger 'start'
        
    App.router = new Router

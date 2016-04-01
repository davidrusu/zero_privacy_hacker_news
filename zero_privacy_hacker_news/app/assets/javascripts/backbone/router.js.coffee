App.module "Router", (Router, App, Backbone, Marionette, _) ->
    class Router extends Backbone.Router
        routes:
            "story/:id": "loadStory"
            "user/:user": "loadUser"
            "": "mainPage"
        loadStory: (id) ->
            console.log 'routing to story page'
            story = new App.Model.Story id, false

            # TODO: all this data fetching should be done somewhere else...
            story.fetch success: -> 
                App.Model.currentStory = story
                App.Model.currentComments = new App.Model.Comments (story.get "kids"), false
                # fetch each top level comment, a fetch of a top level
                # comment will trigger the a fetch for all the child comments
                App.Model.currentComments.map (comment) -> comment.fetch()
                App.StoryApp.trigger 'start'

        loadUser: (user) ->
            console.log "routing to user page"
            user = new App.Model.User user
            App.UserApp.API.showUser user

        mainPage: ->
            console.log 'routing to main page'
            App.MainApp.trigger 'start'
        
    App.router = new Router

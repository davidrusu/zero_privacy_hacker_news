@App.module "StoryApp", (StoryApp, App, Backbone, Marionette, $, _) ->
        StoryApp.API =
            showStory: (story) ->
                StoryApp.Show.Controller.showStory(story)


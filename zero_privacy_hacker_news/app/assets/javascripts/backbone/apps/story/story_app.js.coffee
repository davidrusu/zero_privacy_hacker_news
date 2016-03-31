@App.module "StoryApp", (StoryApp, App, Backbone, Marionette, $, _) ->
        @startWithParent = false;
        
        StoryApp.on "start", -> StoryApp.Show.Controller.showStory()


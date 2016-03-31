App.module "StoryApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    Show.Controller =
        showStory: ->
            mainView = @getStoryView()
            App.mainRegion.show mainView
        
        getStoryView: -> new Show.Comments
            collection: App.Model.currentComments

    class Show.Comment extends Marionette.CompositeView
        childView: Show.Comment
        
        template: (model) ->
            if model.text
                return "<div class=\"comment_body\"> #{model.text} </div>"
            else
                return '<div class="loader">Loading...</div>'
        
        initialize: ->
            @collection = @model.get "kids"
        
        attachHtml: (collectionView, itemView) ->
            # Append the child comments in the right order
            collectionView.$("div:first").append itemView.el
        
    class Show.Comments extends Marionette.CollectionView
        childView: Show.Comment
        collectionEvents:
            "sync": "render"


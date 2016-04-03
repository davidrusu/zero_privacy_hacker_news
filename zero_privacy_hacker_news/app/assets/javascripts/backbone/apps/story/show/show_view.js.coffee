App.module "StoryApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    Show.Controller =
        showStory: (story) ->
            mainView = @getStoryView(story)
            App.mainRegion.show mainView
        
        getStoryView: (story) ->
            # fetch each top level comment, a fetch of a top level
            # comment will trigger the a fetch for all the child comments
            comments = new App.Model.Comments (story.get "kids"), false
            comments.map (comment) -> comment.fetch()
            
            new Show.Comments collection: comments

    class Show.Comment extends Marionette.CompositeView
        childView: Show.Comment
        modelEvents:
            "sync": "render"
        
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


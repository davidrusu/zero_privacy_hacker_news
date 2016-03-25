App.module "StoryApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    console.log('storyapp')
    Show.Controller =
        showStory: ->
            mainView = @getStoryView()
            App.mainRegion.show mainView
        
        getStoryView: -> new Show.Comments
            collection: App.Model.currentComments


    class Show.Comment extends Marionette.CompositeView
        childView: Show.Comment
        
        template: (model) ->
                console.log "templating", model, @model
                "<div class=\"comment_body\"> #{model.text}</div>"
        
        initialize: ->
            console.log "initing comment", @model, @model.get "kids"
            @collection = @model.get "kids"

        serializeModel: (model) ->
            result = 
                id: model.attributes.id
                text: model.attributes.text
                by: model.attributes.by
                time: model.attributes.time
            console.log 'serializing', result, model
            result
        
        attachHtml: (collectionView, itemView) ->
            console.log "appendinghtml", itemView.el 
            collectionView.$("div:first").append itemView.el
        
        modelEvents:
            "change": "modelChanged"

        modelChanged: ->
                
        
        
    class Show.Comments extends Marionette.CollectionView
        childView: Show.Comment
        collectionEvents:
            "sync": "render"


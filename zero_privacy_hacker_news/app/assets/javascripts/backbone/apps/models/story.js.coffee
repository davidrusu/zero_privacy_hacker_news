App.module "Model", (Model, App, Backbone, Marionette, $, _) ->
    TOP_STORIES_URL = "https://hacker-news.firebaseio.com/v0/topstories.json"
    ITEM_URL = "https://hacker-news.firebaseio.com/v0/item/"
    NUM_SHOWN = 10

    # Since comments are a tree, we build the backbone model
    # recursively, where a comment is a backbone model, and the
    # children of the comment are a backbone collection
        
    class Model.Comment extends Backbone.Model
        url: -> ITEM_URL + @id + ".json"
        initialize: (id) ->
            @set 'id', id
            @fetch
                success: -> App.trigger 'sync'
        
        parse: (comment) ->
            kidsData = if comment.kids then comment.kids else []
            result =
                kids: new Model.Comments kidsData
                text: comment.text
                id: comment.id
                time: comment.time
                by: comment.by
            result

    class Model.Comments extends Backbone.Collection
        model: Model.Comment

    Model.currentStory = undefined
    Model.currentComments = undefined
        
    class Model.Story extends Backbone.Model
        url: -> ITEM_URL + @id + ".json"
        initialize: (id, doFetch = true) ->
            @id id
            if doFetch
                @fetch() # fetch the story with this id
        id: (id) -> @set id: id
    
    class Model.Stories extends Backbone.Collection
        url: TOP_STORIES_URL
        model: Model.Story
        parse: (data) -> _.take(data, NUM_SHOWN)

    Model.stories = new Model.Stories
    Model.stories.fetch()




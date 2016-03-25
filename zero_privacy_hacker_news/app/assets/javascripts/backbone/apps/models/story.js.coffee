App.module "Model", (Model, App, Backbone, Marionette, $, _) ->
    TOP_STORIES_URL = "https://hacker-news.firebaseio.com/v0/topstories.json"
    ITEM_URL = "https://hacker-news.firebaseio.com/v0/item/"
    NUM_SHOWN = 10
    
    class Model.Story extends Backbone.Model
        url: () -> ITEM_URL + @id + ".json"
        initialize: (id) ->
            @id id
            @fetch() # fetch the story with this id
                
        id: (id) -> @set id: id
    
    class Model.Stories extends Backbone.Collection
        url: TOP_STORIES_URL
        model: Model.Story
        parse: (data) -> _.take(data, NUM_SHOWN)

    Model.stories = new Model.Stories
    Model.stories.fetch()


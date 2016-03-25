App.module "MainApp.Show", (Show, App, Backbone, Marionette, $, _) ->

    Show.Controller =
        showMain: ->
            mainView = @getMainView()
            App.mainRegion.show mainView
        
        getMainView: -> new Show.Main collection: App.Model.stories

    class Show.Story extends Marionette.ItemView
        className: "story"
        template: (model) ->
            if not model.title
                return "Story is loading"
            
            comment_button_msg =
                if model.kids then "#{model.kids.length} comments" else "No comments"
            
            "
            <div class=\"story_score\"> #{model.score} </div>
            <div class=\"story_title\">
              <a href=\"#{model.url}\"> #{model.title} </a>
            </div>
            <button class=\"story_author\">
              #{model.by}
            </button>
            <button class=\"story_comments\"> #{comment_button_msg} </button>
            <a href=\"#story/#{model.id}\">test_link</a>
            "

        ui:
            author: ".story_author"
            comments: ".story_comments"
                
        onRender: ->
            model = @model
            @ui.comments.click ->
                    route = "story/#{model.id}"
                    console.log "hey", App.router
                    App.router.navigate route
            _.bind @ui.comments.click, @
    class Show.Main extends Marionette.CollectionView
        childView: Show.Story
        collectionEvents:
            "sync": "render"


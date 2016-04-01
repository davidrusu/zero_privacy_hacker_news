App.module "Model", (Model, App, Backbone, Marionette, $, _) ->
    USER_URL = (username) ->
        "https://hacker-news.firebaseio.com/v0/user/#{username}.json"

    class Model.User extends Backbone.Model
        url: -> USER_URL(@username)

        initialize: (username) ->
            @set 'username', username
            @fetch()

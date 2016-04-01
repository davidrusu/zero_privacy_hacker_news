App.module "UserApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    Show.Controller = 
        showUser: (userModel) ->
            userView = @getUserView userModel
            App.mainRegion.show userView

        getUserView: (userModel) ->
            new Show.User model: userModel

    class Show.User extends Marionette.ItemView
        template: (data) ->
            console.log 'user', data
            if not data.karma
                return "<div class='loader'>Loading</div>"
            "
            <div class='user-container'>
                <div class='user-username'>user: #{data.username}</div>
                <div class='user-karma'>karma: #{data.karma}</div>
                <div class='user-about'>about: #{data.about}</div>
            </div>
            "
        modelEvents:
            'sync': 'render'

App.module "UserApp", (UserApp, App, Backbone, Marionette, $, _) ->
        @startWithParent = false;
        UserApp.API =
            showUser: (user) ->
                UserApp.Show.Controller.showUser user
        

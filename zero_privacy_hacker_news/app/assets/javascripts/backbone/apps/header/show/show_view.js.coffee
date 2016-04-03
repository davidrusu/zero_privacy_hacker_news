App.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->
    LOGIN_URL="/user"
    
    Show.Controller = 
        showHeader: ->
            headerView = @getHeaderView()
            App.headerRegion.show headerView

        getHeaderView: ->
            new Show.Header

        logout: ->
            window.localStorage.removeItem('session')
            @showHeader()

        login: (uname, pass) ->
            console.log "logging in with #{uname}, #{pass}"
            $.ajax
                url: LOGIN_URL,
                data:
                    username: uname,
                    password: pass
                method: 'GET'
                success: ((data) ->
                    console.log data
                    if data.session
                        window.localStorage.setItem('session', data.session)
                        console.log "testing"
                        @showHeader()
                    else
                        $.ajax
                            url: LOGIN_URL,
                            data:
                                username: uname,
                                password: pass
                            method: 'POST'
                            success: ((data) ->
                                console.log 'created user', data
                                if data.session
                                    window.localStorage.setItem('session', data.session)
                                else
                                    console.log 'failed to create user'
                                    
                                @showHeader()).bind @
                ).bind @

    class Show.Header extends Marionette.ItemView
        template: (data) ->
                session = window.localStorage.getItem('session')
                console.log session
                popup = $('<div id="login_popup">')
                
                logout = $('<button id="logout_btn">logout</button>')
                logout.click -> Show.Controller.logout()
                
                if not session
                    logout.hide() 
                    username = $('<input id="uname_input" type="text" placeholder="username">')
                    password = $('<input id="pass_input" type="password" placeholder="password">')
                    button = $('<button>Login or Register</button>')
                    button.click ->
                        Show.Controller.login(
                            $('#uname_input').val(),
                            $('#pass_input').val()
                        )
                    
                    popup = popup
                              .append($("<h3>You aren't logged in!</h3>"))
                              .append($('<p>login or create an account.</p>'))
                              .append(username)
                              .append($('<br>'))
                              .append(password)
                              .append($('<br>'))
                              .append($('<br>'))
                              .append(button)
                else
                    popup.hide()

                header = $('<span>')
                    .append($('<div id="hn_logo">Y</div>'))
                    .append($('<a id="hn_name" href="/">Hacker News</div>'))
                    .append(logout)
                    .append(popup)
                return header

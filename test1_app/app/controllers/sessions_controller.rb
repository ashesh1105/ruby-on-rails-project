class SessionsController < ApplicationController

    def new

    end

    def create
        # if you uncomment line below, you get same login form back:
        # render 'new'

        # if you uncomment debugger line below and submit form on browser, it pauses there, go to
        # terminal where rails server is running and type 'params' and you'll see an object like:
        # {"utf8"=>"✓", 
        #     "authenticity_token"=>"bqcf71VaBK42z4Ht8ndGDfeV/C/Io2nqyUdXf7dJsU6+hD8oqbhR5WbLww5gtFaC1UR4Fq9M4da+yM7j9oVLOQ==", 
        #     "session"=>{"username"=>"ashesh", "password"=>"password"}, "commit"=>"Log in", 
        #     "controller"=>"sessions", "action"=>"create"}
        # Now, if you type params[:session], you get {"username"=>"ashesh", "password"=>"password"}
        # If you type params[:session][:username], you get username:
        # debugger
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in!"
            redirect_to user_path(user)
        else
            # Since session is not a model-back, we need to give error message right here
            # flash.now does not persist beyond one http request
            flash.now[:danger] = "There was something wrong with your login information!"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You've logged out!"
        redirect_to welcome_home_path
    end


end
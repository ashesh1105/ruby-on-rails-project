class WelcomeController < ApplicationController

    def home
        # This will not let user see home page if they're logged in and taken them to All Articles Page!
        redirect_to articles_path if logged_in?
    end

    def about

    end
    
end
class ArticlesController < ApplicationController

    # before_action is executed in order, so ensure right order!
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    # This will restrict a user not logged in to perform an action except index and show
    before_action :require_user, except: [:index, :show]
    # Allow edit, update or destroy action to a user if (s)he created that article!
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def index
        # @articles = Article.all
        # Below code allows pagination
        @articles = Article.all.paginate(page: params[:page], per_page: 5)
    end

    # This will allow the <domain>/articles/new path feasible in FE
    # With this, FE will look for a file new.html.erb under views/articles folder 
    def new
        @article = Article.new
    end

    def create
        # You can use below line to display on browser the details in form being sent to Backend
        # render plain: params[:article].inspect

        # Can use debugger due to 'byebug' gem added in Gemfile
        # byebug

        # Create a new variable to hold new article info send to Backend and whitelist that using custom method: article_params
        @article = Article.new(article_params)
        # @article.user = User.first  # Hard coding a user to provide it to New Articles for now
        # we know current_user will be required from before action anyway
        @article.user = current_user
        if @article.save
            flash[:success] = "Article was successfully created!"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
        # Below line is commented since it is taken care by set_user private method, to be called by before_action defined above
        # @article = Article.find(params[:id])
    end

    def edit
        # Below line is commented since it is taken care by set_user private method, to be called by before_action defined above
        # @article = Article.find(params[:id])
    end

    def update
        # Below line is commented since it is taken care by set_user private method, to be called by before_action defined above
        # @article = Article.find(params[:id])
        if @article && @article.update(article_params)
            flash[:success] = "Article was successfully updated!"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        # Below line is commented since it is taken care by set_user private method, to be called by before_action defined above
        # @article = Article.find(params[:id])
        @article.destroy

        flash[:danger] = "Article was successfully deleted!"
        redirect_to articles_path
    end

    private

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:danger] = "You can only edit, update or delete your own articles!"
            redirect_to welcome_home_path
        end
    end

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:article_id, :title, :description)
    end

end
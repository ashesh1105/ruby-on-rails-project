class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # If user not logged in as current user, take him/her to All Articles Page and not that user's profile
    if !logged_in? || current_user != @user
      redirect_to articles_path
    end

    # Below line is commented since it is taken care by set_user private method, to be called by before_action defined above
    # @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    # Below line is commented since it is taken care by set_user private method, to be called by before_action defined above
    # @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Article Management App #{@user.username}!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    # The below code in user model takes care of deleting all the articles when user is deleted!
    # has_many :articles, dependent: :destroy
    flash[:danger] = "User and all articles created by user have been deleted!"
    redirect_to users_path
  end

  private

    def require_admin
      unless logged_in? && current_user.admin?
        flash[:danger] = "Only admin users can perform that action!"
        redirect_to welcome_home_path
      end
    end

    def require_same_user
      unless current_user == @user && !current_user.admin?
        flash[:danger] = "You can only edit your own account!"
        redirect_to welcome_home_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end

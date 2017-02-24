class UsersController < ApplicationController

  # before_action :require_login, except: [:new_user, :register, :sessions, :login] # every method here except those listed will requre login which is verfied by the require_login method in application_controller.rb
  # before_action :require_correct_user, only: [:show, :edit_user, :update, :delete] #
  def index
  end

  def show
    @user = User.find(params[:id])
    # ra@secrets = Secret.all.where(Secret.all:{})
  end

  def login
    # fail
    if (@user = User.find_by(email: params[:Email])) && @user.authenticate(params[:Password]) # use bcrypt authenticate method to check entered password
        session[:user_id] = @user.id # use session key name user_id or something else that's not just id because id is what named routes uses. Might work but might as well make them different
        redirect_to "/users/#{@user.id}"
    else
      flash[:error] = "Invalid Email/Password combination."
      redirect_to '/users/index'
    end
  end

  def new
  end

  def update
  	@user = User.update(params[:id],user_params)
  	redirect_to "/users/" + @user.id.to_s
    # render json:session[:id]
  end

  def edit
    @user = User.find(params[:id])

  end

  def create
    @user = User.new(email: params[:Email], name: params[:Name], password: params[:Password])
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end

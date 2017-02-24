class LikesController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def like
    Like.create(user: User.find(session[:user_id]), secret: Secret.find(params[:sid]))
    redirect_to '/secrets'
  end

  def unlike
    Like.find_by_secret_id_and_user_id(params[:sid], session[:user_id]).destroy
    redirect_to '/secrets'
    # render json:session[:user_id]


  end
end

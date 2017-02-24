class SecretsController < ApplicationController
  def index

    @secrets = Secret.all
    # render json:@secrets
  end

  def new
  end

  def show
  end

  def edit
  end

  def delete
    # render json: session[:user_id]
    if Secret.find(params[:id]).user == User.find(session[:user_id])
      Secret.find(params[:id]).destroy
    else
      flash[:error] = "Can not delete."
    end
      redirect_to "/users/#{session[:user_id]}"
  end

  def new_secret
    User.find(session[:user_id]).secrets.create(content: params[:"New Secret"])
    redirect_to "/users/#{session[:user_id]}"
    # render json: session[:user_id]
  end
end

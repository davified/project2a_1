class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authentication(params[:password])
      redirect_to root_path, notice: "Logged In"
    else
      flash.now.alert = "Invalid Login Details"
      render :new
    end
  end

  def destroy
  end
end

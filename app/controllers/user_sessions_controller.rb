class UserSessionsController < ApplicationController
  # before_action :set_referer, only: [:new]

  def new
    @user = User.new
  end

  def create
    if login(params[:email], params[:password], params[:remember])
      redirect_to(root_path, notice: "Signed in successfully")
    else
      flash.now[:alert] = "Invalid email or password"
      render action: "new"
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: "Signed out")
  end
end

class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: "Signed in successfully")
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

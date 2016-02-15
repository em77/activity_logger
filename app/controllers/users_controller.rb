class UsersController < ApplicationController
  # before_action :require_login

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: "User deleted"
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.new(user_params)
    # if @user.save
    #   redirect_to @user
    #   flash.now.notice = "User created"
    # else
    #   redirect_to new_user_path
    #   flash.now.alert =  "All fields must be completed and" +
    #     " passwords must match"
    # end
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice:
          "User created" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

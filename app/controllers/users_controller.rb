class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show, :destroy]
  # after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    user = User.find(params[:id])
    authorize User
    user.destroy
    redirect_to users_path, notice: "User deleted"
  end

  def update
    @user = User.find(params[:id])
    authorize User
    if @user.update(user_params)
      redirect_to users_path, success: "User updated"
    else
      redirect_to users_path, alert: "User update failed"
    end
  end

  def new
    @user = User.new
  end

  def create
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
      params.require(:user).permit(:email, :password, :password_confirmation,\
        :role)
    end
end

class UsersController < ApplicationController
  before_action :logged_in!, :authorize_user!, only: [:edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def authorize_user!
    @user = User.find(params[:id])
    redirect_to "/" unless current_user?(@user)
  end
end

class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destory

  def show
  	@user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to the QDB!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated profile"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to root_path
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in." 
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      @user = User.find(params[:id])
      redirect_to root_path unless @user.admin?
    end


  def user_params
    params.
      require(:user).
      permit(:name, :email, :password, :password_confirmation)
  end
end

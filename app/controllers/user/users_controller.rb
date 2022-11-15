class User::UsersController < ApplicationController
   before_action :set_user, only: [:edit, :show, :update, :destroy]
  before_action :can_destroy?, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:user, @user]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(user_params)
      redirect_to [:user, @user]
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if current_user.id != @user.id
      @user.destroy
    else
      flash[:danger] = "You can't delete yourself!"
    end
    redirect_to action: :index
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :role, :is_maker, :is_taker, :password)
    end

    def can_destroy?
      if current_user.id == @user.id
        flash[:danger] = "You can't delete yourself!"
        redirect_to action: :index
      elsif current_user.user? and (@user.user? or @user.superuser?)
        flash[:danger] = "You are not permitted to do that!"
        redirect_to action: :index
      elsif current_user.superuser? and @user.superuser?
        flash[:danger] = "You are not permitted to do that!"
        redirect_to action: :index
      end
    end
end

# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update]
  before_action :require_login, except: %i[signup create]
  before_action :require_admin, only: [:destroy]

  def signup
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render :signup
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to current_user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :realname, :email, :password, :password_confirmation)
  end

  def correct_user # 現在ログインしているユーザーと更新したいユーザー情報が一致しているか
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end

  def require_login # ログインを要求するメソッド
    redirect_to login_url unless logged_in?
  end

  def require_admin # ユーザーに対し管理者か判定するメソッド
    redirect_to root_url unless current_user.admin?
  end
end

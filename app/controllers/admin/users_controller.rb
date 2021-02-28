# frozen_string_literal: true

# 管理者専用なのでモジュール化
module Admin
  class UsersController < AdminController
    def index
      @users = User.all
    end

    def update
      @user = User.find(params[:id])
      if @user.admin? # ユーザーが管理者かチェック
        @user.update(admin: false)
      else
        @user.update(admin: true)
      end
      redirect_to admin_users_url
    end
  end
end

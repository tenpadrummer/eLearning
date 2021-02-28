# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
      @users = User.all
    end

    def update
      @user = User.find(params[:id])
      if @user.admin?
        @user.update(admin: false)
      else
        @user.update(admin: true)
      end
      redirect_to admin_users_url
    end
  end
end

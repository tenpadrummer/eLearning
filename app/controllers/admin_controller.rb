# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :require_admin

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end

# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(current_user.id)
      @activities = @user.feed
      render 'users/home_feed'
    end
  end
end

# frozen_string_literal: true

class WordsController < ApplicationController
  before_action :require_login
  
  def index
    @user = User.find(params[:user_id])
    @answers = @user.answers
  end
end

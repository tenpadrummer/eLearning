# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :require_login
  
  def index
    @categories = Category.all
    @lesson = Lesson.new
  end

  def new; end
end

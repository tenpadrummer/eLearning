# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @lesson = Lesson.new
  end

  def new; end
end

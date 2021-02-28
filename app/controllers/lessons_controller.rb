# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :require_login
  
  def index
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
      @lesson.create_activity(user_id: current_user.id) # レッスンに対してアクティビィティを作成する。
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def lesson_params
    params.permit(:category_id).merge(user_id: current_user.id)
  end
end

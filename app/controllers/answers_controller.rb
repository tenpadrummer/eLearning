# frozen_string_literal: true

class AnswersController < ApplicationController
  def index; end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @category = Category.find(@lesson.category_id)
    if @lesson.next_word.nil?
      redirect_to lesson_path(@lesson)
    else
      @answer = @lesson.answers.build
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.build(answer_params)
    redirect_to new_lesson_answer_url(@lesson) if @answer.save
  end

  private

  def answer_params
    params.permit(:word_id, :choice_id, :lesson_id)
  end
end

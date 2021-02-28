# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers

  belongs_to :category
  belongs_to :user
  has_one :activity, as: :action, dependent: :destroy

  def next_word
    (category.words - words).first
  end

  def correct_choice
    choices.where(correct: true)
  end
end

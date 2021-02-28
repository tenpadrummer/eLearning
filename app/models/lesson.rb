# frozen_string_literal: true

class Lesson < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  has_many :choices, through: :answers

  belongs_to :category
  belongs_to :user
  has_one :activity, as: :action, dependent: :destroy

  # DBから次の問題（単語）を表示するためのメソッド
  def next_word
    (category.words - words).first
  end

  # 3択問題のうち正しい回答にするメソッド
  def correct_choice
    choices.where(correct: true)
  end
end

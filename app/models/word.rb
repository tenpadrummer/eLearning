# frozen_string_literal: true

class Word < ApplicationRecord
  has_many :choices, dependent: :destroy
  has_many :lessons, through: :answer
  belongs_to :category

  validates :content, presence: true
  validate :check_box

  accepts_nested_attributes_for :choices

  def correct_choice
    choices.find_by(correct: true)
  end

  private

  def check_box
    correct_answer = choices.collect { |c| c.correct || nil }
    errors.add(:choices, 'checkbox should be 1 !') if correct_answer.compact.size != 1
  end
end

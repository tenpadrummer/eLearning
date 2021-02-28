# frozen_string_literal: true

class Word < ApplicationRecord
  has_many :choices, dependent: :destroy
  has_many :lessons, through: :answer
  belongs_to :category

  validates :content, presence: true
  validate :check_box # カスタムバリデータ

  # モデル同士が関連付けられている時、ネストさせることで一度にまとめてレコードの更新ができるようにする。
  accepts_nested_attributes_for :choices

  # 3択問題で、選んだ回答が正しいかcorrect: trueで判定する
  def correct_choice
    choices.find_by(correct: true)
  end

  private

  # 3択問題で、正しい答えは1つにしかできないようにするメソッド
  def check_box
    correct_answer = choices.collect { |c| c.correct || nil }
    errors.add(:choices, 'checkbox should be 1 !') if correct_answer.compact.size != 1
  end
end

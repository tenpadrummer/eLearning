# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :lessons, dependent: :destroy
  has_many :answers, through: :lessons
  has_many :activities, dependent: :destroy
  # class_nameで1つのモデルに対して、二つのアソシエーションを組む。
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  # 中間テーブルがあるのでsourceオプションを使用。
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :nickname, presence: true, length: { maximum: 10, minimum: 3 }
  validates :realname, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, allow_nil: true

  # フォローするメソッド
  def follow(other_user)
    following << other_user
  end

  # アンフォローのメソッド
  def unfollow(other_user)
    following.delete(other_user)
  end

  #フォローしているか調べるメソッド
  def following?(other_user)
    following.include?(other_user)
  end

  # フォロー/アンフォローのアクティビィティを検索するメソッド
  def feed
    following_ids = 'SELECT followed_id FROM relationships WHERE follower_id = :user_id'
    Activity.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end
end

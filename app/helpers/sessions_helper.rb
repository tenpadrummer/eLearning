# frozen_string_literal: true

module SessionsHelper
  def login(user) # sessionを使用したログイン用メソッド
    session[:user_id] = user.id
  end

  def current_user # sessionを使用した現在ログイン済ユーザーメソッド
    User.find_by(id: session[:user_id])
  end

  def logged_in? # 現在ユーザーがログインしているか存在しているか判定するメソッド
    !current_user.nil?
  end

  def logout #sessionを使用したログアウト用メソッド
    session.delete(:user_id)
  end
end

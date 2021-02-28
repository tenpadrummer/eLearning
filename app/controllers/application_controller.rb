# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper # セッションヘルパーをどこでも使用可能にする。
  add_flash_types :success, :warning, :danger, :info # Bootstrap対応のフラッシュメッセージ設定
end

# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :action, polymorphic: true # ポリモーフィック関連の設定。
  belongs_to :user
end

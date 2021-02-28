# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :realname
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.timestamps
    end
  end
end

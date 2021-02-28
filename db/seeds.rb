# frozen_string_literal: true

User.create!(
  nickname: 'admin',
  realname: 'IAM',
  email: 'admin@gmail.com',
  password: 'adminuser',
  password_confirmation: 'adminuser',
  created_at: '2019-10-10 09:33:35',
  updated_at: '2019-10-10 09:33:35',
  admin: true
)

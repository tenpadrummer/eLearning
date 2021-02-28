# frozen_string_literal: true

# 管理者専用なのでモジュール化
module Admin
  module UsersHelper
    # ユーザーのプロフィール写真に「Gravatar」を使用できるようにする。
    def gravatar_for(user, options = { size: 80 })
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      image_size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url)
    end
  end
end

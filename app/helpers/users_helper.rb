# frozen_string_literal: true

module UsersHelper
  # ユーザーのプロフィール写真に「Gravatar」を使用できるようにする。
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    image_size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url)
  end

  def user_act(id)
    User.find(id)
  end
end

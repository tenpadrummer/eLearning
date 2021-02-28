# frozen_string_literal: true

module Admin
  module UsersHelper
    def gravatar_for(user, options = { size: 80 })
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      image_size = options[:size]
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url)
    end
  end
end

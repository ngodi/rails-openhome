module ApplicationHelper
    def avatar_url(user, size)
      gravatar_id = Digest::MD5.hexdigest(current_user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    end
  end
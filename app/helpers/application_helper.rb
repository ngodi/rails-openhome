module ApplicationHelper
    def avatar_url(user)
      gravatar_id = Digest::MD5.hexdigest(current_user.email.downcase)
     if user.image
        user.image
     else
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=300"
     end
    end
  end
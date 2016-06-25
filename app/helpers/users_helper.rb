module UsersHelper
  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?default=https%3A%2F%2Fs-passets-cache-ak0.pinimg.com%2Fimages%2Fapi%2Fattrib%2Fshutterstock.png"
    image_tag(gravatar_url, alt: user.email, class: "gravatar", size: "50x50")
  end
end

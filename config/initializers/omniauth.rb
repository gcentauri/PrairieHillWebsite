OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # if Rails.env.production?
  #   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  # elsif Rails.env.development?
  #   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], {:scope => 'email', :info_fields => 'email, name,first_name,last_name,gender'}
  # else
  #   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  # end
end

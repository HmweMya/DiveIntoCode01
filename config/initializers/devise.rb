
Devise.setup do |config|
 
  config.secret_key = 'ebc39e3618754b763543930265ba8ccfe31793b3edc000705ee0389c7ac29660b34416f5303d9003495d2edb6b86070f71bf96aa4e19593d22ed28ddbee8ea72'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..72

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete
  
    if Rails.env.production? 
      config.omniauth :facebook, ENV["FACEBOOK_ID_PRODUCTION"], ENV["FACEBOOK_SECRET_KEY_PRODUCTION"], :scope => 'email', :display => 'popup', :info_fields => 'name, email',:image_size => 'bigger'
      config.omniauth :twitter, ENV["TWITTER_ID_PRODUCTION"], ENV["TWITTER_SECRET_KEY_PRODUCTION"],:image_size => 'bigger'
      
      
    else
      config.omniauth :facebook, ENV["FACEBOOK_ID_DEVELOPMENT"], ENV["FACEBOOK_SECRET_KEY_DEVELOPMENT"], :scope => 'email', :display => 'popup', :info_fields => 'name, email'
      config.omniauth :twitter, ENV["TWITTER_ID_DEVELOPMENT"], ENV["TWITTER_SECRET_KEY_DEVELOPMENT"],:image_size => 'bigger'
    end

end

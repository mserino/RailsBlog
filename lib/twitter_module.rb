require "twitter"

module TwitterModule

  @@client = Twitter::REST::Client.new do |config|
	  config.consumer_key        =	Rails.application.secrets.twitter_consumer_key
	  config.consumer_secret     = 	Rails.application.secrets.twitter_consumer_secret
	  config.access_token        = 	Rails.application.secrets.twitter_oauth_token
	  config.access_token_secret = 	Rails.application.secrets.twitter_oauth_token_secret
	end

  def user_timeline(qt)
    @@client.user_timeline(count: qt)
  end

end
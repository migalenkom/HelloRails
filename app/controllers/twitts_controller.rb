class TwittsController < ApplicationController


  def index
    @user = configure_twitter_client.user("mishutkiss")
    @timeline = configure_twitter_client.user_timeline("mishutkiss")

  end

private

  def configure_twitter_client
    client ||= Twitter::REST::Client.new do |config|
    config.consumer_key        = "YMSFqgKX4J2OE7OZkxT2PNJzg"
    config.consumer_secret     = "KXUvvjWR56uzBEJTnsf3Fbi7uONfU4mLOAS8eCd9R2RmwZvq6D"
    config.access_token        = "809192640-eOUE31qLgIXLDNgYfEf8udbOQWRXAZNhxlQJg5UD"
    config.access_token_secret = "2rGvxdsCiNnmwE67h6HKimbxH8LWj9Mej780K4YYDe4qk"
  end
end

end

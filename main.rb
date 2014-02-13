# -*- encoding: utf-8 -*-
require 'tweetstream'
require 'twitter'
require './key.rb'
Twitter.configure do |config|
   config.consumer_key        = Const::CONSUMER_KEY
   config.consumer_secret     = Const::CONSUMER_SECRET
   config.oauth_token            = Const::ACCESS_TOKEN
   config.oauth_token_secret  = Const::ACCESS_TOKEN_SECRET
end
TweetStream.configure do |config|
   config.consumer_key        = Const::CONSUMER_KEY
   config.consumer_secret     = Const::CONSUMER_SECRET
   config.oauth_token            = Const::ACCESS_TOKEN
   config.oauth_token_secret  = Const::ACCESS_TOKEN_SECRET
   config.auth_method            = :oauth
end

client = TweetStream::Client.new
client.track("Scalaですから","Scalaですからｗ") do |status|
  unless status.text.include?("RT") or status.text.include?("http") or status.text.include?(".co") or status.text.include?("@") or status.user.screen_name == "sa2mi"
    Twitter.update("#{status.user.screen_name}さんが#{status.created_at.strftime("%H:%M:%S")}に#{status.text}しました")
  end
end
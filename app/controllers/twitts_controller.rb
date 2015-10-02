class TwittsController < ApplicationController


  def index

    @user = $twitter_client.user("mishutkiss")
    @timeline = $twitter_client.user_timeline("mishutkiss")

  end


end

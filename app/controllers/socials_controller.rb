class SocialsController < ApplicationController

  def index

    if current_user

      conf = current_user.api_configs
      conf_yl = conf.yelp
      conf_tw = conf.twitter
      conf_fb = conf.fb

      googleApi = GooglePlus.api_key = 'AIzaSyDmwWb706_EyvCM2NyIIqpmI2qdJo5s0TY'

      @googlePerson = GooglePlus::Person.get(101583788431523019210, :key => 'AIzaSyDmwWb706_EyvCM2NyIIqpmI2qdJo5s0TY')

      @googleActivity = GooglePlus::Activity.get(101583788431523019210)

      # binding.pry

      twClient = configure_twitter_client(conf_tw)
      ylClient = create_yelp_client(conf_yl)



      @user = twClient.user(conf_tw.social_user_name)
      @timeline = twClient.user_timeline(conf_tw.social_user_name)
      @business = ylClient.business(conf_yl.social_user_name)

      if params[:code]
      # acknowledge code and get access token from FB
      session[:access_token] = session[:oauth].get_access_token(params[:code])
      end

      # auth established, now do a graph call:
      @api = Koala::Facebook::API.new(session[:access_token])

      begin
      @fb_profile = @api.get_object("me?fields=name,picture,posts,link")

      rescue Exception=>ex
      puts ex.message
      #if user is not logged in and an exception is caught, redirect to the page where logging in is requested
      redirect_to '/login' and return
      end

    end
    respond_to do |format|
    format.html {   }
    end

  end

  #########################################################

  def login
    conf_fb= current_user.api_configs.fb
    session[:oauth] = Koala::Facebook::OAuth.new(conf_fb.key, conf_fb.secret, 'http://localhost:3000/socials/')
    @auth_url =  session[:oauth].url_for_oauth_code(permissions:"user_posts")

    redirect_to @auth_url
  end

  #########################################################

private

  def configure_twitter_client(tw_conf)

    client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = tw_conf.key
      config.consumer_secret     = tw_conf.secret
      config.access_token        = tw_conf.token
      config.access_token_secret = tw_conf.token_secret
    end
  end

  def create_yelp_client(yl_conf)

    @yelp_client ||=
        Yelp::Client.new({consumer_key: yl_conf.key,
                          consumer_secret: yl_conf.secret,
                          token: yl_conf.token,
                          token_secret: yl_conf.token_secret
                         })
  end

end

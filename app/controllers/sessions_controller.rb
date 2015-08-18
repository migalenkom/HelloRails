class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:sessions][:email], params[:sessions][:password])
    if user
      session[:user_id] = user.id
      if user.isAdmin?
        redirect_to organizations_path, :notice => "Logged in!"
      else

        redirect_to organizations_path, :notice => "Logged in!"
      end

    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

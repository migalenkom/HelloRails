class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def edit
    if current_user
      @user = User.find(session[:user_id])
    end
  end

  def update
    @user = User.find(session[:user_id])

    respond_to do |format|
      @user.update_attributes(params[:user])
      format.html { redirect_to sign_up_path, notice: 'User was successfully updated.' }
      format.js {}
6+
  end
end
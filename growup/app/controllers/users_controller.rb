class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction


  def new
	@user = User.new
  end

  def index
    @users = User.rank(:row_order).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.js

    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end


  def create
	@user = User.new(params[:user])
	if @user.save
    session[:user_id] = @user.id
    redirect_to root_url, :notice => "Signed up! & logged in"
	else
	render "new"
	end
  end


  def edit
	if current_user
	@user = User.find(session[:user_id])
  else
      @user = User.find(params[:id])

  respond_to do  |format|

    format.html{ }
    format.js {}

  end

  end
  end

  def update
    @user = User.find(session[:user_id])

    respond_to do |format|
      @user.update_attributes(params[:user])
      format.html { redirect_to sign_up_path, notice: 'User was successfully updated.' }

      format.js {}
      #   format.js {}
      # if @user.update_attributes(params[:user])
      #   format.html { redirect_to sign_up_path, notice: 'User was successfully updated.' }
      #   format.js {}
      # else
      #   format.html { render action: "edit" }
      # end
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
      format.js
    end
  end

  def current_resource
    @current_resource ||= User.find(params[:id]) if params[:id]
  end

def update_row_order
  @user = User.find(params[:user][:id])
  @user.attributes = params[:user]
  @user.save

  respond_to do |format|
    # format.html { redirect_to users_url }
    format.json {  head :no_content }
    format.js
  end

end

  private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
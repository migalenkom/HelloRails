class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def new
    @user = User.new
  end

  def index
    @users = User.order(sort_column + " " + sort_direction).paginate(:per_page => per_page, :page => params[:page])

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

  def show_images
    @user = User.find(session[:user_id])
    respond_to do |format|
      format.html { render "user_images" }

    end
  end


  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), :notice => "Signed up! & logged in"
    else
      render "new"
    end
  end

  def resetpass

    if request.post?
      @user = User.find_by_email(params[:resetpass][:email])
      pass= params[:resetpass][:password].to_s
      confirm_pass = params[:resetpass][:confirm_password].to_s

      if  @user.present? && !pass.empty? && pass.eql?(confirm_pass)

        @user.password= pass
        @user.save

      else

        redirect_to :back, notice: 'Not found or passwords are not match'
        return
      end

      respond_to do |format|

        format.html { redirect_to log_in_path, notice: 'Password was successfully updated.' }
        format.js {}

      end
    else
      if request.get?

        respond_to do |format|
          format.html { render 'resetpass' }
          format.js {}
        end
      end
    end
  end

  def edit
    if current_user && (current_user.isAdmin? || current_user.superAdmin?)
      @user = User.find(params[:id])
    else
      @user = User.find(session[:user_id])
    end
    respond_to do |format|

      format.html {}
      format.js {}

    end


  end

  def update

    @user = nil

    if current_user && (current_user.isAdmin? || current_user.superAdmin?)
      @user = User.find(params[:id])
    else
      @user = User.find(session[:user_id])
    end

    if  @user.present?
      @user.update_attributes(user_params)

    end

    respond_to do |format|

      format.html do

        if @user.present?
          redirect_to user_path(@user), notice: 'User was successfully updated.'
        else
          redirect_to edit_user_path(@user), notice: 'Incorrect values'
        end

      end

      format.js {}

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

  def sort

    params[:user].each_with_index do |id, index|

      User.where(id: id).update_all(row_order: index+1+params[:page].to_s.to_i*per_page)

    end

    render nothing: true

  end

  private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "row_order"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def per_page
    4
  end

  def user_params
    # params.require(:user)
    params.require(:user).permit(:name, :email, :isAdmin, :superAdmin, :password, :password_confirmation, :row_order, :avatar)
  end

end
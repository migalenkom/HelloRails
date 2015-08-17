class MembersController < ApplicationController

  def index
    @organization = Organization.find_by_id(params[:organization_id])
    @members = @organization.users
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  def new
    @member = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.js {}
    end
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @member = User.find_by_id(member_params[:id])
    @organization.users << @member
    if @member.save{
      respond_to do |format|
        format.html {redirect_to  organization_member_path, :notice => "Member Created"}
        format.js {}
      end
    }
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @organization = Organization.find_by_id(params[:organization_id])
    @member = UserOrganization.find_by_user_id_and_organization_id(params[:id],params[:organization_id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to  organization_member_path}
      format.js
    end
  end
  def current_resource

    # if params.has_key?(:id)
    #   @current_resource = UserOrganization.find_by_organization_id_and_user_id(params[:organization_id],params[:id])
    # else
      @current_resource = Organization.find_by_id(params[:organization_id])
    # end
    # return @current_resource
  end

  private
  def member_params
    params.require(:member).permit(:id)
  end

end
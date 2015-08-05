class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
    respond_to do |format|
      format.html # index.html.erb
      format.js {}
    end
  end

  def new
    @organization = Organization.new
        respond_to do |format|
      format.html # new.html.erb
      format.js {}
      # format.json { render json: @organization }
    end
  end

  def create
    @organization = current_user.created_organizations.new(organization_params)
    current_user.organizations << @organization

    if @organization.save{

      respond_to do |format|
        format.html {redirect_to organizations_path, :notice => "Organization Created"}
        format.js {}

      end
    }
    else
      render "new"
    end
  end


  def edit
    @organization = Organization.find(params[:id])

    respond_to do |format|
      format.html {}
      format.js {}

    end
  end
  def update

    @organization = Organization.find(params[:id])

    if  @organization.present?
      @organization.update_attributes(organization_params)
    end
    respond_to do |format|

      format.html do
        if @organization.present?
          redirect_to organization_path(@organization), notice: 'Organization was successfully updated.'
        else
          redirect_to edit_organization_path(@organization), notice: 'Incorrect values'
        end
      end
      format.js {}
    end
  end

  def destroy

    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
      format.js
    end
  end

  def organization_params
    params.require(:organization).permit(:name, :description)
  end

end

class ProjectsController < ApplicationController

  def index
    @organization = Organization.find(params[:organization_id])
    @projects = @organization.projects
    respond_to do |format|
      format.html # index.html.erb
      format.js {}
    end
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @project = Project.new
    respond_to do |format|
      format.html {render nothing: true }
      format.js {}
    end
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @project = Project.new(project_params)

    if @project.save{

      respond_to do |format|
        format.html {redirect_to  organization_project_path, :notice => "Project Created"}
        format.js {}
      end
    }
    else
      render 'new'
    end
  end
  def edit
    @organization = Organization.find(params[:organization_id])
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html { render nothing: true}
      format.js {}

    end
  end
  def update
    @organization = Organization.find(params[:organization_id])
    @project = Project.find(params[:id])

    if  @project.update_attributes(project_params)

        respond_to do |format|
          format.js {}
          format.json {render status: 200}
        end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to  organization_project_path}
      format.js
    end
    end

  private

  def project_params
    params.require(:project).permit(:name, :description, :organization_id)
  end

end
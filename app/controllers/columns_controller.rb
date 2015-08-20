class ColumnsController < ApplicationController

    def index
      @project =Project.find(params[:project_id])
      @columns = @project.columns
      respond_to do |format|
        format.html # index.html.erb
        format.js
      end
    end

    def new
      @project = Project.find(params[:project_id])
      @column = Column.new
      respond_to do |format|
        format.html {render nothing: true }
        format.js {}
      end
    end

    def create
      @project = Project.find(params[:project_id])
      @column = Column.new(column_params)
      if @column.save{
        respond_to do |format|
          format.html {redirect_to  organization_project_path, :notice => "Column Created"}
          format.js {}
        end
      }
      else
        render 'new'
      end
    end

    def edit
      @project = Project.find(params[:project_id])
      @column = Column.find(params[:id])
      respond_to do |format|
        format.html { render nothing: true}
        format.js {}
      end
    end
    def update
      @project = Project.find(params[:project_id])
      @column = Column.find(params[:id])
      if  @column.update_attributes(column_params)

        respond_to do |format|
          format.js {}
          format.json {render status: 200}
        end
      end
    end

    def destroy
      @column = Column.find(params[:id])
      @column.destroy
        respond_to do |format|
          format.html { redirect_to  project_column_path}
          format.js
        end
      end
    def current_resource
      @current_resource = Column.find_by_id(params[:id])
    end

    private
    def column_params
      params.require(:column).permit(:id,:name,:position,:project_id)
    end

end
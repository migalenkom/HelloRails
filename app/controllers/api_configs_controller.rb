class ApiConfigsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: ApiConfigsDatatable.new(view_context) }
    end
  end

  def new
    @api_config = ApiConfig.new
    respond_to do |format|
    format.html # new.html.erb
    format.js {}
    end
  end

  def create
    @api_config = ApiConfig.new(config_params)
     if @api_config.save {
       respond_to do |format|
         format.html {redirect_to api_configs_path, :notice => "Config Created"}
         format.js {}
        end
     }
     else
      render "new"
     end
  end

  def edit
    @api_config = ApiConfig.find(params[:id])

    respond_to do |format|
      format.html {}
      format.js {}

    end
  end

  def show
    @api_config = ApiConfig.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def update

    @api_config = ApiConfig.find(params[:id])

    if  @api_config.present?
      @api_config.update_attributes(config_params)
    end
    respond_to do |format|

      format.html do
        if @api_config.present?
          redirect_to api_config_path(@api_config), notice: 'Organization was successfully updated.'
        else
          redirect_to api_config_path(@api_config), notice: 'Incorrect values'
        end
      end
      format.js {}
    end
  end

  def destroy

    @api_config = ApiConfig.find(params[:id])
    @api_config.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def config_params
    params.require(:api_config).permit(:name, :key, :secret,:token, :token_secret)
  end
end

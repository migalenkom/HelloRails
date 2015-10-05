class ApiConfigsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: ApiConfigsDatatable.new(view_context) }
    end
  end



end

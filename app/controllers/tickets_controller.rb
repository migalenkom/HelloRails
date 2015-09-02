class TicketsController < ApplicationController

  # def index
  #   @column = Column.find(params[:column_id])
  #   @tickets = @column.tickets
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.js
  #   end
  # end

  def create
    @column = Column.find(params[:column_id])
    @ticket = Ticket.new(ticket_params)
    if @ticket.save{
      respond_to do |format|
        format.html {redirect_to  organization_project_path, :notice => "Ticket Created"}
        format.js {}
      end
    }
    else
      render 'new'
    end
  end

  def new
    @column = Column.find(params[:column_id])
    @ticket = Ticket.new
    respond_to do |format|
      format.html {render nothing: true }
      format.js {}
    end
  end

  def edit
    @column = Column.find(params[:column_id])
    @ticket = Ticket.find(params[:id])
    respond_to do |format|
      format.html { render nothing: true}
      format.js {}
    end
  end

  def update
    @column = Column.find(params[:column_id])
    @ticket = Ticket.find(params[:id])
    if  @ticket.update_attributes(ticket_params)
      respond_to do |format|
        format.js {}
        format.json {render status: 200}
      end
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to  column_ticket_path}
      format.js
    end

  end
  private
  def ticket_params
    params.require(:ticket).permit(:id,:name,:position,:column_id)
  end

end

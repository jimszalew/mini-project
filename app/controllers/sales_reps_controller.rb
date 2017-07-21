class SalesRepsController < ApplicationController

  def new
    @sales_rep = SalesRep.new()
  end

  def show
    @sales_rep = SalesRep.find_by(params[:user_id])
  end
end

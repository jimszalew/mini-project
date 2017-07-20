class SalesRepsController < ApplicationController

  def new
    @sales_rep = SalesRep.new()
  end
end

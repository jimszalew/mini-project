class SalesRepsController < ApplicationController

  def new
    @sales_rep = SalesRep.new()
  end

  def create
    @sales_rep = SalesRep.new(sales_rep_params)
    if @sales_rep.save
      flash[:success] = "#{@sales_rep.name} added!"
      redirect_to sales_rep_path(@sales_rep)
    else
      render :new
    end
  end

  def show
    @sales_rep = SalesRep.find_by(params[:user_id])
  end

  private

  def sales_rep_params
    params.require(:sales_rep).permit(:name, :company, :category, :email, :phone)
  end
end

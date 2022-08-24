class RentalsController < ApplicationController
  def index
    @rentals = Rental.where(user: current_user)
  end
  
  def show
    @rental = Rental.find(params[:id])
  end
  
  def new
    @item = Item.find(params[:item_id])
    @rental = Rental.new()
  end
  
  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    if @rental.save
      redirect_to item_rentals
    else
      render :new
    end
  end
  
  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to item_rentals, status: :see_other
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end

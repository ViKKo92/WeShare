class RentalsController < ApplicationController
  def index
    @rentals = Rental.where(user: current_user)
  end
  
  def show
    @rental = Rental.find(params[:id])
    @item = @rental.item
  end
  
  def new
    @item = Item.find(params[:item_id])
    @rental = Rental.new()
  end
  
  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.item = Item.find(params[:item_id])
    if @rental.save
      redirect_to edit_user_registration_path
    else
      render :new
    end
  end
  
  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to edit_user_registration_path, status: :see_other
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end

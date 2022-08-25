class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

if params[:category]
    @items = Item.where(category: params[:category])
elsif  params[:query]
  @items = Item.search_by_name_and_description(params[:query])
else
  @items = Item.all
end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :price_per_day, :photo)
  end
end

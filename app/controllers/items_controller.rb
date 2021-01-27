class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(
    :image, :name, :message, :category_id, :state_id, :delivery_fee_id,
    :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

end

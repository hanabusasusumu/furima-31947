class OrdersController < ApplicationController
  def new
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(user_order_params)
    if @user_order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number)
  end
end
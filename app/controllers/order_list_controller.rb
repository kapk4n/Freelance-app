class OrderListController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  end
end

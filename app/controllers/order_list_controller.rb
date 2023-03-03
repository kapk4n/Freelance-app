require 'date'

class OrderListController < ApplicationController
  def index
    orders = Order.all
    orders.each do |i|
      if i.deadline < Date.today
        i.update(status: 'finished')
      else
        i.update(status: 'good')
      end
    end
    @orders = Order.where(status: 'good')
  end

  def add
  end

  def show
  end
end

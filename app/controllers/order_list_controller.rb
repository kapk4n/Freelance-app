require 'date'

class OrderListController < ApplicationController
  def index
    orders = Order.all
    orders.each do |i|
      if i.deadline < Date.today
        i.update(status: 'finished')
      end
    end
    @orders = Order.where(status: 'good', freelanc_id: nil) 
  end

  def filter
    @orders = Order.all
    @result_message_order = @orders.where("message LIKE :search", search: "%#{params[:search_param]}%")
    @result_title_order = @orders.where("title LIKE :search", search: "%#{params[:search_param]}%")
    @array_of_searching = @result_message_order | @result_title_order
  end

  def add
  end

  def show
  end
end

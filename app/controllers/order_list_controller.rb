require 'date'

class OrderListController < ApplicationController
  def index
    orders = Order.all
    @categories_of_orders = Order.categories

    orders.each do |i|
      if i.deadline < Date.today
        i.update(status: 'finished')
      end
    end
    @orders = Order.where(status: 'good', freelanc_id: nil) 
  end

  def filter

    @orders = Order.all
    @categories_of_orders = Order.categories
    a = Order.all
    @result_message_order = @orders.where("message LIKE :search", search: "%#{params[:search_param]}%")
    @result_title_order = @orders.where("title LIKE :search", search: "%#{params[:search_param]}%")
    @array_of_searching = @result_message_order | @result_title_order

    unless params[:check_category].nil?
      b = []
      params[:check_category].map(&:split).each do |i|
        b |= a.where(category: i[1].to_i)
      end
    else
      b = a
    end

    # unless params[:check_busy].nil?
    #   c = [] 
    #   params[:check_busy].map(&:split).each do |i|
    #     c |= a.where(status: i[1].to_i)
    #   end
    # else
    #   c = a
    # end

    unless params[:check_cost_start].empty? && params[:check_cost_end].empty?
      d = []
      @orders.each do |i|
        i.cost.between?(params[:check_cost_start].to_i, params[:check_cost_end].to_i) ? d |= [i] : nil
      end
      d.nil? ? d = a : nil
    else
      d = a
    end

    # unless params[:check_experienc].nil?
    #   e = []
    #   params[:check_experienc].map(&:split).each do |i|
    #     e |= a.where(experienc: i[1].to_i)
    #   end
    # else
    #   e = a
    # end

    f1 = a.find_all{|i| i.title.downcase.include?"#{params[:search_param]}".downcase }
    f2 = a.find_all{|i| i.message.downcase.include?"#{params[:search_param]}".downcase }

    # @array_of_result = b & c & d & (f1 | f2) & e
    @array_of_result = b & d & (f1 | f2)
  end

  def add
  end

  def show
  end
end

class OrderProfController < ApplicationController
  before_action :order_checking

  def index
    @cur_user = Current.user
    @order = Order.find_by(id: params[:id])
  end

  def show
    @order = Order.find_by(id: params[:id])
    if PreOrder.where(order_id: params[:id]).count.zero?
      render "show"
    else
      flash[:alert] = "You can not edit this order. This order has already taken by someone"
      redirect_to ord_prof_path(id: params[:id])
    end
  end

  def prefree
    @preorder = PreOrder.where(order_id: params[:id])
    @freelancers = Freelancer.all
    if @preorder.count.zero?
      redirect_to ord_prof_path(id: params[:id]), alert: "Nobody have taken your order"
    end
  end

  def take_freelance
    Order.find_by(id: params[:id]).update(freelanc_id: params[:fr_id])
    PreOrder.where(order_id: params[:id]).destroy_all
    redirect_to ord_prof_path(id: params[:id]), notice: "good"
  end

  def edit
    order = Order.find_by(id: params[:id])

    params[:title] != '' ? order.update(title: params[:title]) : flash[:alert] = "Can not be empty"

    params[:deadline] != '' ? order.update(deadline: params[:deadline]) : flash[:alert] = "Can not be empty"

    params[:cost] != '' ? order.update(cost: params[:cost]) : flash[:alert] = "Can not be empty"

    params[:message] != '' ? order.update(message: params[:message]) : flash[:alert] = "Can not be empty"

    if order.deadline > Date.today
      order.update(status: 'good')
    end

    redirect_to ord_prof_path(id: params[:id])
  end

  def delete
    @order = Order.find_by(id: params[:id])
    if PreOrder.where(order_id: params[:id]).count.zero?
      Order.find_by(id: params[:id]).destroy
      redirect_to order_list_path
    else
      flash[:alert] = "You can not delete this order. This order has already taken by someone"
      redirect_to ord_prof_path(id: params[:id])
    end
  end

  def submitting
    if Current.user.role == 'freelancer' && PreOrder.where(freelancer_id: Current.user.freelancers.first.id, order_id: params[:order_id]).count.zero? && Order.find_by(id: params[:order_id]).status == 'good' 
      PreOrder.create(order_id: params[:order_id], freelancer_id: params[:freelancer_id])
      redirect_to ord_prof_url(id: params[:id])
    else
      flash[:alert] = "You have already taken"
    end
  end

  def archivate
    ord = Order.find_by(id: params[:id])
    if ord.status == 'finished' && ord.deadline > Date.today
      ord.update(status: 'good')
    else
      ord.update(status: 'finished')
    end
    redirect_to ord_prof_path(id: ord.id)
  end
end

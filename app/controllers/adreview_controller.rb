class AdreviewController < ApplicationController
  def index
    # if Current.user.role != 'client'
    #   redirect_to root_path
    # else
    #   @freelan = User.find_by(id: params[:id])
    # end
  end

  def show
    @freelan = User.find_by(id: params[:id]).freelancers.first
    @order_list = Order.where(client_id: Current.user.clients.first.id, freelanc_id: @freelan.id)
    if @order_list == []
      redirect_to profile_path(id: params[:id]), alert: "This feelancer does not have your's order"
    end
  end

  def edit
    Review.create(mark: params[:mark], message: params[:message], order_id: params[:user][:order].to_i, freelancer_id: params[:id])
    redirect_to profile_path(id: Freelancer.find_by(id: params[:id]).user.id)
  end
end

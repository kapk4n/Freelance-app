class ProfileController < ApplicationController
  before_action :profile_checking, except: [:input_data, :add_order]

  def index
    @freelancer = User.find_by(id: params[:id]).freelancers.first
  end

  def input_data
  end

  def add_order
    @order = Order.new(ord_params)
    if @order.save 
      redirect_to order_list_path
    else
      flash[:alert] = "wrong data"
      redirect_to order_list_path
    end
  end

  def show
    unless Current.user.nil? || Current.user.role.nil?
      @user = User.find_by(id: params[:id])
      @freelan = @user.freelancers.first
      @client = @user.clients.first
      # @order = Order.where(client_id: @client.id)

      if @user.role == 'freelancer' 
        marks = Review.where(freelancer_id: @freelan.id)
        @adr_marks = 0.0
        @count_good = 0
        @count_bad = 0
        if marks != []
          marks.each do |i|
            @adr_marks += i.mark
            if i.mark >= 3
              @count_good += 1
            elsif i.mark < 3
              @count_bad += 1
            end
          end
          @adr_marks = @adr_marks / marks.count
        end
      end

    else
      redirect_to root_path, alert: 'You must be logged in'
    end
  end

  def edit
    frela = User.find_by(id: params[:id]).freelancers.first

    params[:status] != '' ? frela.update(status: params[:status].to_i) : flash[:alert] = "Can not be empty"

    params[:info] != '' ? frela.update(info: params[:info]) : flash[:alert] = "Can not be empty"

    params[:stack] != '' ? frela.update(stack: params[:stack]) : flash[:alert] = "Can not be empty"

    params[:education] != '' ? frela.update(education: params[:education]) : flash[:alert] = "Can not be empty"

    params[:experienc] != '' ? frela.update(experienc: params[:experienc].to_i) : flash[:alert] = "Can not be empty"

    params[:category] != '' ? frela.update(category: params[:category].to_i) : flash[:alert] = "Can not be empty"

    redirect_to profile_path(id: params[:id])
  end

  private

  def ord_params
    params.permit(:title, :deadline.to_s, :cost, :message, :client_id, :freelanc_id, :status, :category)
  end
end
class FreelaListController < ApplicationController
  def index
    @freelancers = Freelancer.all
  end

  def show
  end

  def filter
    @freelancers = Freelancer.all
    @result_stack_freelancer = @freelancers.where("stack LIKE :search", search: "%#{params[:search_param]}%")
    @result_info_freelancer = @freelancers.where("info LIKE :search", search: "%#{params[:search_param]}%")
    @array_of_searching = @result_stack_freelancer | @result_info_freelancer
  end
end

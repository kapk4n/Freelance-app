class ProfileController < ApplicationController
  before_action :profile_checking

  def index
    @freelancer = User.find_by(id: params[:id]).freelancers.first
    # Freelancer.statuses.with_index
  end

  def show
    @user = User.find_by(id: params[:id])
    @freelan = @user.freelancers.first
  end

  def edit
    frela = User.find_by(id: params[:id]).freelancers.first

    params[:status] != '' ? frela.update(status: params[:status].to_i) : flash[:alert] = "Can not be empty"

    params[:info] != '' ? frela.update(info: params[:info]) : flash[:alert] = "Can not be empty"

    params[:stack] != '' ? frela.update(stack: params[:stack]) : flash[:alert] = "Can not be empty"

    params[:education] != '' ? frela.update(education: params[:education]) : flash[:alert] = "Can not be empty"

    params[:languag] != '' ? frela.update(languag: params[:languag]) : flash[:alert] = "Can not be empty"

    params[:experienc] != '' ? frela.update(experienc: params[:experienc].to_i) : flash[:alert] = "Can not be empty"

    redirect_to profile_path(id: params[:id])
  end
end
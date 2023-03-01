class AdreviewController < ApplicationController
  def index
    # if Current.user.role != 'client'
    #   redirect_to root_path
    # else
    #   @freelan = User.find_by(id: params[:id])
    # end
  end

  def show
    @freelan = User.find_by(id: params[:id])
  end

  def edit
  end
end

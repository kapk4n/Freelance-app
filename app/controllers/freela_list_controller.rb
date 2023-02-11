class FreelaListController < ApplicationController
  def index
    @freelancers = Freelancer.all
  end

  def show
  end
end

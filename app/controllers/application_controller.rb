require 'date'

class ApplicationController < ActionController::Base
  before_action :set_current_user
  # around_action :switch_locale
  # def set_locale
  #   I18n.locale = :en
  # end

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def profile_checking
    if User.find_by(id: params[:id]).nil?
      redirect_to root_path, alert: 'Wrong id'
    end
  end

  def order_checking
    if Order.find_by(id: params[:id]).nil?
      redirect_to root_path, alert: 'Wrong id'
    end
  end
end

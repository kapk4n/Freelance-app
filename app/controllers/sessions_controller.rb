class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirect_to root_path, notice: "#{t('.notice1')}"
      redirect_to root_path, notice: "succsessfuly loged in"
    else
      # flash[:alert] = "#{t('.alert')}"
      flash[:alert] = "wrong data"
            # render action: "new", status: :unprocessable_entity
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    # redirect_to root_path, notice: "#{t('.notice2')}"
    redirect_to root_path, notice: "user destroyed"
  end
end
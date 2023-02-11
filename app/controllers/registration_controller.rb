class RegistrationController < ApplicationController
  def new
    @user = User.new
    @users_roles = User.roles.except(:admin)
    @rol_ar = []
    @sex_ar = []
    User.roles.except(:admin).each do |i|
      @rol_ar.push(i[0].to_s)
    end
    User.sexes.each do |i|
      @sex_ar.push(i[0].to_s)
    end
    @users_sexes = User.sexes
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if @user.role == 'freelancer'
        Freelancer.create(user_id: @user.id)
      elsif @user.role == 'client'
        Client.create(user_id: @user.id)
      end
      session[:user_id] = @user.id
      redirect_to root_path, notice: "sucsessfully created"
    else
      flash[:alert] = "wrong data"
      redirect_to sign_up_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :f_name, :l_name, :password_confirmation, :role, :sex)
  end
end

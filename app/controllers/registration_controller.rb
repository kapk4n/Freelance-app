class RegistrationController < ApplicationController
  def new
    @user = User.new
    @users_roles = User.roles.except(:admin)
    @users_sexes = User.sexes
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.update(role: params[:role].to_i)
      @user.update(sex: params[:sex].to_i)
      session[:user_id] = @user.id
      redirect_to root_path, notice: "sucsessfully created"
    else
      flash[:alert] = "wrong data"
      redirect_to sign_up_path
    end
  end



  # @ro = params[:role]
  # user = User.find_by(id: params[:id])
  # if (@ro == '1' || @ro == '0') && (!User.find_by(id: params[:id]).nil? && User.find_by(id: params[:id]).role != 'admin')
  #   if user.student? && @ro == '1'
  #     Stud.find_by(user_id: user.id).destroy
  #     Teach.create(user_id: user.id)
  #   end
  #   if user.teacher? && @ro == '0'
  #     unless Predmet.find_by(teach_id: user.teach.first.id).nil?
  #       pred_id = Predmet.find_by(teach_id: user.teach.first.id)
  #       Schedule.where(predmet_id: pred_id.id).destroy_all unless Schedule.find_by(predmet_id: pred_id.id).nil?
  #       List.where(predmet_id: pred_id.id).destroy_all unless List.find_by(predmet_id: pred_id.id).nil?
  #       pred_id.destroy unless pred_id.nil?

  #     end
  #     Teach.find_by(user_id: user.id).destroy
  #     jcreate(user)
  #   end
  #   user.update(role: @ro.to_i)
  #   redirect_to administration_path, notice: "#{t('.notice1')} #{user.email} #{t('.notice2')} #{user.role}"
  # else
  #   redirect_to editrole_new_path(id: params[:id]), alert: "#{t('.alert')}"
  # end

  private

  def user_params
    params.require(:user).permit(:email, :password, :f_name, :l_name)
  end
end
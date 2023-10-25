# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_invalid_member, only: [:create]

  def guest_sign_in
    if member = Member.guest
      sign_in member
      flash[:notice] = "guest memberでログインしました。"
      redirect_to member_path(member)
    else
      render :new
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # 退会もしくは停止中のアカウントがログインしようとしたときにエラーを出す
  def reject_invalid_member
    member = Member.find_by(email: params[:member][:email])
    return if !member || !member.inactive?
    return if member.valid_password?(params[:member][:password]) && member.active_for_authentication?
    redirect_to request.referer
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

# frozen_string_literal: true

class UserMailer < ApplicationMailer
  before_action :load_user

  def password_reset_code
    @subject = 'Código de verificação - Twitter'
    mail to: @user.email, subject: @subject
  end

  protected

  def load_user
    @user = params[:user]
    @code = params[:code]
  end
end

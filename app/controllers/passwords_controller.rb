class PasswordsController < Devise::PasswordsController
  before_action :load_user

  def create
    if @user.nil?
      render json: {}, status: :not_found
    else
      code = @user.generate_code
      @user.reset_password_token = code
      @user.reset_password_sent_at = Time.now.utc
      @user.save
      UserMailer.with(user: @user, code: code).password_reset_code.deliver_now!
      render json: {}, status: :ok
    end
  end

  protected

  def load_user
    @user = User.find_by_email(user_params)
  end

  def user_params
    params.require(:email)
  end
end

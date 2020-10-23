class CodeValidationsController < ApplicationController
  before_action :load_user

  def create
    if @user.nil?
      render json: {}, status: :not_found
    else
      token, payload = Warden::JWTAuth::UserEncoder.new.call(@user, :user, nil)
      whitelist = AllowlistedJwt.new(whitelist_params(payload))
      whitelist.save
      render json: {token: token}
    end
  end

  protected

  def load_user
    @user = User.find_by_reset_password_token(code_params)
  end

  def code_params
    params.require(:reset_password_token)
  end

  def whitelist_params(payload)
    {
        user_id: @user.id,
        jti: payload["jti"],
        exp: Time.at(payload["exp"]),
        aud: payload["aud"]
    }
  end
end

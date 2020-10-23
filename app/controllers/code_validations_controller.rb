class CodeValidationsController < ApplicationController
  load_resource find_by: :reset_password_token

  def create
    if @user.nil?
      render json: {}, status: :not_found
    else
      token, payload = Warden::JWTAuth::UserEncoder.new.call(@credential, :credential, nil)
      whitelist = AllowlistedJwt.new(whitelist_params(payload))
      whitelist.save
      render json: {token: token}
    end
  end

  protected

  def code_params
    params.require(:code)
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

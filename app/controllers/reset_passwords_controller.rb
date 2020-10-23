class ResetPasswordsController < ApplicationController
  authorize_resource class: User

  def update
    if current_ability.update(reset_params)
      render json: current_ability
    else
      render json: current_ability.errors, status: :unprocessable_entity
    end
  end

  protected

  def reset_params
    params.permit(:password)
  end
end

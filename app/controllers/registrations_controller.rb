# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  wrap_parameters :registration

  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save
    if resource.errors.empty?
      sign_in(resource)
      render json: resource
    else
      validation_error(resource)
    end
  end

  protected

  def sign_up_params
    params.permit(:password,
                  :email,
                  :name,
                  :user_name)
  end
end

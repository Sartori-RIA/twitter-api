# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CodeValidationsController, type: :request do
  let!(:user) { create(:user) }

  describe '#POST /auth/code_validations' do
    it 'should return user token when send code received in email' do
      token = '123456'
      user.reset_password_token = token
      user.save

      attributes = {
          reset_password_token: token
      }
      post auth_code_path,
           params: attributes.to_json,
           headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('token')
    end

    it 'should throw error 404 when code not exists' do
      attributes = {
          reset_password_token: 'bacon'
      }
      post auth_code_path,
           params: attributes.to_json,
           headers: unauthenticated_header
      expect(response).to have_http_status(:not_found)
    end
  end
end

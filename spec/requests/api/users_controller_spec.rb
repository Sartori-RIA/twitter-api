# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::UsersController, type: :request do
  let!(:users) { create_list(:user, 10) }
  let!(:user) { users.sample }
  let!(:user_b) { create(:user) }

  describe '#GET /api/users' do
    it 'should request all users' do
      get api_users_path, headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/users/:id' do
    it 'should request user by id' do
      get api_user_path(users.sample.id), headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/users/search' do
    it 'should search users' do
      user = users.sample
      get search_api_users_path, params: { q: user.user_name }, headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(user.to_json)
    end
  end

  describe '#PUT /api/users/:id' do
    it 'should update a user' do
      user.name = 'editado'
      put api_user_path(user.id), params: user.to_json, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end
    it 'should trow forbidden status' do
      user.name = 'editado'
      put api_user_path(user.id), params: user.to_json, headers: auth_header(user_b)
      expect(response).to have_http_status(:forbidden)
    end
    it 'should throw error with invalid params' do
      user.name = ''
      put api_user_path(user.id), params: user.to_json, headers: auth_header(user)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#DELETE /api/users/:id' do
    it 'should delete user' do
      delete api_user_path(user.id), headers: auth_header(user)
      expect(response).to have_http_status(:no_content)
    end
    it 'should trow forbidden status' do
      delete api_user_path(user.id), headers: auth_header(user_b)
      expect(response).to have_http_status(:forbidden)
    end
  end
end

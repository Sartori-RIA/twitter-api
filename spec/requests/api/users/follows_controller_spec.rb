# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Users::FollowsController, type: :request do
  let!(:users) { create_list(:user, 10) }
  let!(:user) { users.sample }
  let!(:follows) { create_list(:follow, 10, user: user) }

  describe '#GET /api/users/:user_id/follows' do
    it 'should request all user follows' do
      get api_user_follows_path(user_id: user.id),
          headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      json.each do |data|
        expect(data['user_id']).to eq(user.id)
      end
    end
  end

  describe '#POST /api/users/:user_id/follows' do
    let!(:user_b) { create(:user) }
    it 'should start to follow other user' do
      attributes = {
          follow_id: user_b.id
      }
      post api_user_follows_path(user_id: user.id),
           params: attributes.to_json,
           headers: auth_header(user)
      expect(response).to have_http_status(:created)
    end
    it 'should throw error with invalid params' do
      post api_user_follows_path(user_id: user.id),
           params: {},
           headers: auth_header(user)
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'should throw forbidden status to' do
      post api_user_follows_path(user_id: user.id),
           params: {},
           headers: auth_header(user_b)
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe '#DELETE /api/users/:user_id/follows' do
    let!(:user_b) { create(:user) }
    let!(:follow) { follows.sample }
    it 'should stop to follow a user' do
      delete api_user_follow_path(user_id: follow.user_id, id: follow.id),
             headers: auth_header(follow.user)
      expect(response).to have_http_status(:no_content)
    end
    it 'should throw forbidden status to invalid user' do
      delete api_user_follow_path(user_id: follow.user_id, id: follow.id),
             headers: auth_header(user_b)
      expect(response).to have_http_status(:forbidden)
    end
  end
end

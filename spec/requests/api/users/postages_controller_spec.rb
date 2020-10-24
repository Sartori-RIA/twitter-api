# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Users::PostagesController, type: :request do
  let!(:user) { create(:user) }
  let!(:user_b) { create(:user) }
  let!(:posts) { create_list(:postage, 100, user: user) }

  describe '#GET /api/users/:user_id/postages' do
    it 'should request all user postages' do
      get api_user_postages_path(user_id: posts.sample.user_id),
          headers: unauthenticated_header
      expect(response).to have_http_status(200)
    end
  end

  describe '#GET /api/users/:user_id/postages/:id' do
    let!(:user_postage) { posts.sample }
    it 'should request user postage by id' do
      get api_user_postage_path(
              id: user_postage.id,
              user_id: user_postage.user_id
          ),
          headers: unauthenticated_header
      expect(response).to have_http_status(200)
    end
  end

  describe '#POST /api/users/:user_id/postages' do
    let!(:user_postage) { posts.sample }

    it 'should create a user postage' do
      attributes = attributes_for(:postage).merge(user_id: user.id)
      post api_user_postages_path(
               user_id: user_postage.user_id
           ),
           params: attributes.to_json,
           headers: auth_header(user)
      expect(response).to have_http_status(201)
    end
    it 'should throw error with invalid params' do
      post api_user_postages_path(
               user_id: user_postage.user_id
           ),
           params: {},
           headers: auth_header(user)
      expect(response).to have_http_status(422)
    end
  end

  describe '#PUT /api/users/:user_id/postages' do
    let!(:user_postage) { posts.sample }
    it 'should update a user postage' do
      user_postage.content = 'editado'
      put api_user_postage_path(
              id: user_postage.id,
              user_id: user_postage.user_id
          ),
          params: user_postage.to_json,
          headers: auth_header(user)
      expect(response).to have_http_status(200)
    end
    it 'should trow forbidden status' do
      user_postage.content = 'editado'
      put api_user_postage_path(
              id: user_postage.id,
              user_id: user_postage
          ),
          params: user_postage.to_json,
          headers: auth_header(user_b)
      expect(response).to have_http_status(403)
    end
    it 'should throw error with invalid params' do
      user_postage.content = nil
      put api_user_postage_path(
              id: user_postage.id,
              user_id: user_postage
          ),
          params: user_postage.to_json,
          headers: auth_header(user)
      expect(response).to have_http_status(422)
    end
  end

  describe '#DELETE /api/users/:user_id/postages/:id' do
    let!(:user_postage) { posts.sample }
    it 'should delete user postage' do
      delete api_user_postage_path(
                 id: user_postage.id,
                 user_id: user_postage.user_id
             ),
             headers: auth_header(user)
      expect(response).to have_http_status(204)
    end
    it 'should trow forbidden status' do
      delete api_user_postage_path(
                 id: user_postage.id,
                 user_id: user_postage.user_id
             ),
             headers: auth_header(user_b)
      expect(response).to have_http_status(403)
    end
  end
end

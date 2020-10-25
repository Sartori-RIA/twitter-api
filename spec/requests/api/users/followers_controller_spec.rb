# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::Users::FollowersController, type: :request do

  let!(:user) { create(:user) }
  let!(:followers) { create_list(:follow, 10, follow: user) }

  describe '#GET /api/users/:user_id/followers' do
    it 'should request all user followers' do
      get api_user_followers_path(user_id: user.id),
          headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      json.each do |data|
        expect(data["follow_id"]).to eq(user.id)
      end
    end
  end
end

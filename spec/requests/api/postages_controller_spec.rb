# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::PostagesController, type: :request do
  let!(:postages) { create_list(:postage, 10) }

  describe '#GET /api/postages' do
    it 'should request all postages' do
      get api_postages_path,
          headers: unauthenticated_header
      expect(response).to have_http_status(:ok)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AllowlistedJwt, type: :model do
  describe '.validations' do
    context 'with be has associations' do
      it { is_expected.to belong_to(:user) }
    end
  end
end

require 'rails_helper'

RSpec.describe Postage, type: :model do
  describe '.validations' do
    context 'with be has presence' do
      it { is_expected.to validate_presence_of(:content) }
    end
    context 'with be has associations' do
      it { is_expected.to belong_to(:user) }
    end
  end
end

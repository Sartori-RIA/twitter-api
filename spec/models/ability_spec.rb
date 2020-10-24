require 'rails_helper'

RSpec.describe User do
  describe "abilities" do
    subject(:ability) { Ability.new(user, []) }
    let(:user) { nil }

    context "when is an account manager" do
      let(:user) { create(:user) }

      it { is_expected.to be_able_to(:manage, Postage.new) }
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let!(:user) { create(:user) }

  describe 'Reset password code' do
    let!(:code) { '123456' }
    let!(:mail) do
      described_class
        .with(
          user: user,
          code: code
        )
        .password_reset_code
        .deliver_now!
    end

    it 'renders the subject' do
      expect(mail.subject).to eq('Código de verificação - Twitter')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq([ENV['MAILER_USER_NAME']])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.name)
    end

    it 'assigns reset code' do
      expect(mail.body.encoded).to match(code)
    end
  end
end

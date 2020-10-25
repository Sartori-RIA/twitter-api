# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['mailer_user_name']
  layout 'mailer'
end

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  mount_uploader :avatar, AvatarUploader
  mount_uploader :banner, BannerUploader

  acts_as_paranoid

  devise :database_authenticatable,
         :encryptable,
         :registerable,
         :recoverable,
         :confirmable,
         :validatable,
         :trackable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  validates :name, :user_name, presence: true
  validates :user_name, uniqueness: true

  def generate_code
    loop do
      code = ''
      6.times do
        code += (0..9).to_a.sample.to_s
      end
      break code unless User.find_by(reset_password_token: code)
    end
  end
end

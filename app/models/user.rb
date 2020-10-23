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
end

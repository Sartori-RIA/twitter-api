# frozen_string_literal: true

class Postage < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
end

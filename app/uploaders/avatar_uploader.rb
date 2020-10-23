# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*_args)
    'https://s3.us-east-2.amazonaws.com/uploads.sartori.twitter/defaults/download.png'
  end

  process scale: [200, 300]

  version :thumb do
    process resize_to_fit: [150, 150]
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end

  def asset_host
    'http://192.168.0.193'
  end
end

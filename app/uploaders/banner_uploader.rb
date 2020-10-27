# frozen_string_literal: true

class BannerUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/banners/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*_args)
    'https://s3.us-east-2.amazonaws.com/uploads.sartori.twitter/defaults/default_banner.jpeg'
  end


  def extension_whitelist
    %w[jpg jpeg png]
  end

  def asset_host
    'https://sartori-twitter-api.herokuapp.com'
  end
end

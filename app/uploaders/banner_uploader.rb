class BannerUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/banners/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*_args)
    'https://s3.us-east-2.amazonaws.com/uploads.sartori.twitter/defaults/default_banner.jpeg'
  end

  process scale: [1500, 500]

  def extension_whitelist
    %w[jpg jpeg png]
  end

  def asset_host
    'http://192.168.0.193'
  end
end
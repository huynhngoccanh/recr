# encoding: utf-8

class LogoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :file
  else
    storage :aws
  end

  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}/"
  end

  def default_url
    ActionController::Base.helpers.image_url("malcom_butler.jpg")
  end

  version :consistent_square_thumb do
    process resize_to_fill: [200, 200]
  end

  version :medium do
    process resize_to_fit: [400, 350]
  end

  version :medium2 do
    process resize_to_fit: [300, 300]
  end

  version :thumb do
    process resize_to_fit: [342, 262]
  end

  version :thumb2 do
    process resize_to_fit: [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end

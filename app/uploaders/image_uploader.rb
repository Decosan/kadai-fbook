class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # 画像の上限を700pxにする
  # process :resize_to_limit => [700, 700]

  #
  # # サムネイルを生成する設定
  # version :thumb do
  #   process :resize_to_limit => [300, 300]
  # end
  #
  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end

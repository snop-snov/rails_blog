class PostImageUploader < ApplicationUploader
  process :resize_to_fit => [800, 800]

  version :thumb do
    process :resize_to_fit => [100,100]
  end
end

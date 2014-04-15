class Article < ActiveRecord::Base
  mount_uploader :image, PhotoUploader
end

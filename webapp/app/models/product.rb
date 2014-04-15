class Product < ActiveRecord::Base
  belongs_to :store

  mount_uploader :images, PhotoUploader
end

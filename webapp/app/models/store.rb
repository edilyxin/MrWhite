class Store < ActiveRecord::Base
  belongs_to :user
  belongs_to :locate
  belongs_to :productCatalog
	has_many :products

	mount_uploader :logo, PhotoUploader
end

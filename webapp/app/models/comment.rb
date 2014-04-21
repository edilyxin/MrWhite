class Comment < ActiveRecord::Base
	belong_to :user
	belong_to :store
	belong_to :order
end

class IndexController < ApplicationController
  before_action :signed_in_user, only: [:manage]

  def index
  end

	def wx
		render 'wxpages/index'
	end

  def manage
    if current_user.email != 'admin@bgj.com'
      redirect_to root_path
    end
  end
end

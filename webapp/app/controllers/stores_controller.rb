class StoresController < ApplicationController
	before_action :signed_in_user

	def index
		@store_items = Store.paginate(page: params[:page])
	end

	def new
		@store = Store.new 
	end

	def create
		@store = Store.new(store_params)
		@store.save

		redirect_to new_store_path
	end
	
	def update
		@store = Store.find(params[:id])
		if @store.update_attributes(store_params)
			flash[:success] = '更新成功'
			redirect_to stores_path 
		else
			render 'edit'
		end
	end

	def edit
		@store = Store.find(params[:id])
	end

	def destroy
		@store = Store.find(params[:id])
		current_user.stores.delete(@store)
		@store.destroy
		redirect_to stores_path, notice: '删除成功'
	end

	private
		
	def store_params
		params.require(:store).permit(:name, :description, :address, :tel, :area, :logo, :productCatalog_id, :locate_id, :user_id)
	end
end

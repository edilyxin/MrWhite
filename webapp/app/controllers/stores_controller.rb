class StoresController < ApplicationController
	before_action :signed_in_user, except: [:wx_index]

	def index
		@store_items = current_user.stores.paginate(page: params[:page])
	end

	def wx_index
		@store_items = Store.where(locate_id: params[:id]) 
	end

	def new
		@store = Store.new 
	end

	def create
		@store = Store.new(store_params)
		@store.save
		current_user.stores << @store

		redirect_to new_store_path, notice: "保存成功！"
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

	def status
		@store = Store.find(params[:id])
		if @store.status == 1
			@store.status = 0
		else
			@store.status = 1
		end
		@store.save
		redirect_to stores_path, notice: '营业状态已更改'
	end

	private
		
	def store_params
		params.require(:store).permit(:name, :description, :address, :tel, :area, :logo, :productCatalog_id, :locate_id)
	end
end

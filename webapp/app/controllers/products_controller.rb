class ProductsController < ApplicationController
	before_action :signed_in_user, except: [:wx_index]

	def index
		@store = Store.find(params[:store_id])
		@product_items = @store.products.paginate(page: params[:page])
	end

	def wx_index
		@product_items = Store.find(params[:store_id]).products.all
	end

	def new
    @store = Store.find(params[:store_id])
		@product = Product.new 
	end

	def create
		@product = Product.new(product_params)
		@product.save
		store = Store.find(params[:store_id])
		store.products << @product

		redirect_to new_store_product_path
	end
	
	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			flash[:success] = '更新成功'
			redirect_to store_products_path(Store.find(params[:store_id]))
		else
			render 'edit'
		end
	end

	def edit
    @store = Store.find(params[:store_id])
		@product = Product.find(params[:id])
	end

	def destroy
		@product = Product.find(params[:id])
		store = Store.find(params[:store_id])
		store.products.delete(store)
		@product.destroy
		redirect_to store_products_path(store), notice: '删除成功'
	end

	private
		
	def product_params
		params.require(:product).permit(:name, :description, :store_id, :status, :price, :images)
	end
end

class ProductCatalogsController < ApplicationController
	def index
		@product_catalog_items = ProductCatalog.all
	end

	def new
		@product_catalog = ProductCatalog.new
	end

	def create
		@product_catalog = ProductCatalog.new(product_catalog_params)
		@product_catalog.save

		redirect_to new_product_catalog_path, notice: "保存成功！"
	end
	
	def update
		@product_catalog = ProductCatalog.find(params[:id])
		
		if @product_catalog .update_attributes(product_catalog_params)
			flash[:success] = '更新成功'
			redirect_to product_catalogs_path 
		else
			render 'edit'
		end
	end

	def edit
		@product_catalog = ProductCatalog.find(params[:id])
	end

	def destroy
		@product_catalog = ProductCatalog.find(params[:id])
		@product_catalog .destroy
		redirect_to product_catalogs_path, notice: '删除成功'
	end
	
	private

	def product_catalog_params
		params.require(:product_catalog).permit(:name)
	end

end

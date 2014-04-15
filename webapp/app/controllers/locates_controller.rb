class LocatesController < ApplicationController
	def index
		@locate_items = Locate.all
	end

	def new
		@locate = Locate.new
	end

	def create
		@locate = Locate.new(locate_params)
		@locate.save

		redirect_to new_locate_path
	end

	def update
		@locate = Locate.find(params[:id])
		
		if @locate.update_attributes(locate_params)
			flash[:success] = '更新成功'
			redirect_to locates_path 
		else
			render 'edit'
		end
	end

	def edit
		@locate = Locate.find(params[:id])
	end

	def destroy
		@locate = Locate.find(params[:id])
		@locate.destroy
		redirect_to locates_path, notice: '删除成功'
	end
	
	private

	def locate_params
		params.require(:locate).permit(:name)
	end

end


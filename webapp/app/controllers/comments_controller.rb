class CommentsController < ApplicationController
	def index
    @comment_items = Comment.paginate(page: params[:page])
	end

	def destroy 
		@comment = Comment.find(params[:id])
    @comment.destroy
		redirect_to comments_path, notice: "删除成功"
	end
end

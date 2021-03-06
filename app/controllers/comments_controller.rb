class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to post_path(@post)
      end
    
      private
        def comment_params
          params.require(:comment).permit(:content)
        end
    end
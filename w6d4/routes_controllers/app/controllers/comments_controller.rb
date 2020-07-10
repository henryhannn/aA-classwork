class CommentsController < ApplicationController
    def index
        case
        when params[:user_id]
            comment = Comment.where(user_id: params[:user_id])
        when params[:artwork_id]
            comment = Comment.where(artwork_id: params[:artwork_id])
        else
            comment = Comment.all
        end
        render json: comment
    end

    def create
        comment = Comment.new(comments_params)
        if comment.save
        render json: comment, status: :created
        else
        render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy!
        render json: comment
    end
    
    def comments_params
        params.require(:comment).permit(:body, :user_id, :artwork_id)
    end
end
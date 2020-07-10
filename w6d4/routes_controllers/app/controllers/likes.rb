class LikesController < ApplicationController
    # def index
    #     # render json: Artwork.all
    #     owned_artworks = Artwork.where(artist_id: params[:user_id])
    #     shared_artworks = Artwork.where(shared_viewers: params[:user_id])
    #     render json: owned_artworks + shared_artworks
    # end

    def create
        like = Like.new(like_params)
    if like.save
      render json: like, status: :created
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
    end

    def destroy
        like = Like.find(params[:id])
        like.destroy!
        render json: like
    end

    def like_params
        params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
    end
end
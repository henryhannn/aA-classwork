class ArtworksController < ApplicationController
    def index
        # render json: Artwork.all
        owned_artworks = Artwork.where(artist_id: params[:user_id])
        shared_artworks = Artwork.where(shared_viewers: params[:user_id])
        render json: owned_artworks + shared_artworks
    

    end
end
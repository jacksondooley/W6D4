class ArtworksController < ApplicationController
  def index
    if params.has_key?(:user_id)
      @artworks = Artwork.where(artist_id: params[:user_id])
      @artworks += Artworkshare.where(viewer_id: params[:user_id])

    end
    render json: @artworks
  end

  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  end

  def create
    @artwork = Artwork.new(params.require(:artworks).permit(:artist_id, :title, :image_url))
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(params.require(:artworks).permit(:artist_id, :title, :image_url))
      redirect_to artwork_url(@artwork)
    else
      render json: artwork.errors.full_messages
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to artworks_url(@artwork)
  end

  private
  def artwork_params
    params.require(:artwork).permit(:artist_id)
  end
      

end
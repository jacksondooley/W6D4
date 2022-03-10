class ArtworksharesController < ApplicationController
  def index
    render json: Artworkshare.all
  end

  def create
    @artworkshare = Artworkshare.create(artworkshare_params)
      if @artworkshare.save
        render json: @artworkshare
      else
        render json: @artwork.errors.full_messages, status: :unprocessable_entity
      end
  end

  def destroy
    @artworkshare = Artworkshare.find(params[:id])
    @artworkshare.destroy
    redirect_to artworkshares_url(@artworkshares)
  end

  private
  def artworkshare_params
    params.require(:artworkshare).permit(:artwork_id, :viewer_id)
  end

end
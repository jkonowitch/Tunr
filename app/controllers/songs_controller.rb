class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
  end

  def purchase
    @song = Song.find(params[:id])

    if current_user.purchase(@song)
      redirect_to user_path(current_user)
    else
      render :show
    end
  end
end

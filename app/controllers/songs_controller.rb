class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]


  def index
    @songs = Song.all
    render "index"
  end

  def show

  end

  def new
    @song = Song.new
  end

  def create
    # byebug
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      flash[:error] = @song.errors.full_messages
      render "new"
    end
  end

  def edit
    render "edit"
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      flash[:error] = @song.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end



  private
    def find_song
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(
      :title,
      :released,
      :release_year,
      :artist_name,
      :genre
      )
    end

end

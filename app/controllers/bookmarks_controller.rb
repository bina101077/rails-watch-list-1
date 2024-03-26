class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :find_list, only: [:new, :create]
  before_action :bookmark_params, only: [:create, :update]

  def show
  end

  def new
    #@list = List.find(list_params)
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    redirect_to list_path(@list)
    @bookmark.list = @list
    if @bookmark.save
    # else
    #   render :new
    end
  end

  def edit
  end

  def update
    @bookmark.update(bookmark_params)
    if @bookmark.save
     else
    redirect_to list_path(@bookmark)
     end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark)
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end

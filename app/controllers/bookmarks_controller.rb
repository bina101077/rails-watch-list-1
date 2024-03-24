class BookmarksController < ApplicationController

  def new
    @list = List.find(list_params)
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
    redirect_to list_path(@list)
    @bookmark.list = @list
    if @bookmark.save
     else
      render :new
    end
  end

  def update
    @bookmark.update(bookmark_params)
    if @bookmark.save
     else
    redirect_to list_path
     end
end

# frozen_string_literal: true

class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user: user)
  end

  def show
    @bookmark = Bookmark.find_by!(id: params[:id], user: user)
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params.merge(user: user))

    if @bookmark.save
      redirect_to @bookmark
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bookmark = Bookmark.find_by!(id: params[:id], user: user)
  end

  def update
    @bookmark = Bookmark.find_by!(id: params[:id], user: user)

    if @bookmark.update(bookmark_params)
      redirect_to @bookmark
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find_by!(id: params[:id], user: user)
    @bookmark.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :title, :description, :private, :read_later)
  end
end

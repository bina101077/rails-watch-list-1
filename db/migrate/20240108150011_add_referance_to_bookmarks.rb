class AddReferanceToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookmarks, :list
    add_reference :bookmarks, :movie
  end
end

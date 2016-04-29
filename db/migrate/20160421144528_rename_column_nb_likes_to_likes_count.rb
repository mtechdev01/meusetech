class RenameColumnNbLikesToLikesCount < ActiveRecord::Migration
  def change
    rename_column :blog_articles, :nb_likes, :likes_count
    rename_column :projects, :nb_likes, :likes_count
    rename_column :comments, :nb_likes, :likes_count
  end
end

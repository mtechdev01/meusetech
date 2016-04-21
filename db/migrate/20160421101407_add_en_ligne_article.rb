class AddEnLigneArticle < ActiveRecord::Migration
  def change
    add_column :blog_articles, :published, :boolean, default: false
    add_column :blog_articles, :published_at, :datetime
  end
end

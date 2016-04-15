class AjoutColonneCountArticleProjet < ActiveRecord::Migration
  def change
    add_column :projects, :comments_count, :integer
    add_column :blog_articles, :comments_count, :integer
  end
end

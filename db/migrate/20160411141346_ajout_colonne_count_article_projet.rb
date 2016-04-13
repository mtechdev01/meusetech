class AjoutColonneCountArticleProjet < ActiveRecord::Migration
  def change
    add_column :projects, :project_comments_count, :integer
    add_column :blog_articles, :blog_comments_count, :integer
  end
end

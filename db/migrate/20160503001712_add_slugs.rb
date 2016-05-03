class AddSlugs < ActiveRecord::Migration
  def change
    add_column :projects, :slug, :string
    add_column :blog_articles, :slug, :string
    add_column :categories, :slug, :string
  end
end

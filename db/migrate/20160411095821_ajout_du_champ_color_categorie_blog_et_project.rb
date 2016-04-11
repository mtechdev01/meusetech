class AjoutDuChampColorCategorieBlogEtProject < ActiveRecord::Migration
  def change
    add_column :projects_categories, :color, :string
    add_column :blog_categories, :color, :string
  end
end

class RemoveAllCategoryToOneTable < ActiveRecord::Migration
  def change


    create_table :categories do |t|
      t.string  :name
      t.text    :description
      t.string  :icon
      t.string  :color
    end

    add_reference :blog_articles, :category, index: true
    add_reference :projects, :category, index: true

    remove_reference :blog_articles, :blog_category
    remove_reference :projects, :projects_category

    drop_table :blog_categories
    drop_table :projects_categories

  end
end

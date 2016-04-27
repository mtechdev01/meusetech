class TableLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to  :blog_article, index: true, as: :article
      t.belongs_to  :project, index: true
      t.belongs_to  :user, index: true
    end
  end
end

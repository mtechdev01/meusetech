class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.timestamps  null: false
      t.belongs_to  :blog_article, index: true, as: :article
      t.belongs_to  :project, index: true
      t.belongs_to  :user, index: true
      t.text        :content
      t.integer     :nb_likes
    end
  end
end

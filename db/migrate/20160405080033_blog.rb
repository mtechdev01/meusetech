class Blog < ActiveRecord::Migration
  def change

    create_table :blog_articles do |t|
      t.timestamps  null: false
      t.belongs_to  :user, index: true, as: :author
      t.belongs_to  :blog_category, index: true, as: :category
      t.string      :title
      t.text        :content
      t.integer     :nb_fb_shared
      t.integer     :nb_likes
      t.string      :thumb
    end

    create_table :blog_categories do |t|
      t.text    :name
      t.string  :icon
    end

  end
end

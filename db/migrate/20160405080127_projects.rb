class Projects < ActiveRecord::Migration
  def change

    create_table :projects do |t|
      t.timestamps  null: false
      t.belongs_to  :user, index: true
      t.belongs_to  :projects_category, index: true, as: :category
      t.string      :name
      t.text        :content
      t.integer     :nb_fb_shared
      t.integer     :state
      t.datetime    :estimated_at
      t.integer     :nb_likes
    end

    create_table :projects_followers do |t|
      t.timestamps  null: false
      t.belongs_to  :user, index: true
      t.belongs_to  :project, index: true
      t.boolean     :is_followed
    end

    create_table :projects_categories do |t|
      t.string  :name
      t.text    :description
    end

    create_table :projects_comments do |t|
      t.timestamps  null: false
      t.belongs_to  :user, index: true
      t.belongs_to  :project, index: true
      t.text        :content
      t.integer     :nb_likes
    end

  end
end

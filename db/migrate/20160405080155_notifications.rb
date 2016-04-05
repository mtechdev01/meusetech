class Notifications < ActiveRecord::Migration
  def change

    create_table :notifications do |t|
      t.timestamps  null: false
      t.boolean     :is_project
      t.boolean     :is_blog
      t.string      :message
    end

    create_table :notifications_users do |t|
      t.timestamps  null: false
      t.belongs_to  :user, index: true
      t.boolean     :readed
    end

  end
end

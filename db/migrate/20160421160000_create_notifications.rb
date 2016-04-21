class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.timestamps  null: false
      t.string      :model
      t.integer     :key
      t.integer     :sender
      t.integer     :receiver
      t.string      :msg
    end
  end
end

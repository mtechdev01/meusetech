class AjoutChampReadedNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :readed, :boolean, default: false
  end
end

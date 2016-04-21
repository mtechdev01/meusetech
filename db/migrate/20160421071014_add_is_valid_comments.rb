class AddIsValidComments < ActiveRecord::Migration
  def change
    add_column :comments, :is_valid, :boolean, default: false
  end
end

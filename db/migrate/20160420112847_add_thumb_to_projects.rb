class AddThumbToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :thumb, :integer
  end
end

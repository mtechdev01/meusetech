class AddThumbToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :thumb, :string
  end
end

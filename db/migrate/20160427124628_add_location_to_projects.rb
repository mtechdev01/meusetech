class AddLocationToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :location, :string, default: "verdun"
  end
end

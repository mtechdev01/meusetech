class AjoutDuChampLabelDansPollFields < ActiveRecord::Migration
  def change
    add_column :polls_fields, :label, :string
  end
end

class Newsletters < ActiveRecord::Migration
  def change

    create_table :newsletters do |t|
      t.timestamps  null: false
      t.belongs_to  :user, index: true
      t.datetime    :sended_at
      t.boolean     :sended
      t.text        :content
      t.string      :title
    end

    create_table :newsletters_users do |t|
      t.timestamps null: false
      t.belongs_to :user, index: true
      t.belongs_to :newsletter, index: true
    end

  end
end

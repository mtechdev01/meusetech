class Polls < ActiveRecord::Migration
  def change

    create_table :polls do |t|
      t.timestamps  null: false
      t.string      :title
      t.text        :description
      t.integer     :nb_responses
      t.datetime    :start_at
      t.datetime    :end_at
    end

    create_table :polls_fields do |t|
      t.belongs_to  :poll, index: true
      t.string      :input_type
      t.boolean     :is_required
      t.string      :name
      t.string      :options
      t.string      :rules
    end

    create_table :polls_fields_responses do |t|
      t.timestamps  null: false
      t.belongs_to  :poll, index: true
      t.belongs_to  :polls_field, index: true, as: :fields
      t.belongs_to  :user, index: true, as: :user
      t.string      :response
    end

  end
end

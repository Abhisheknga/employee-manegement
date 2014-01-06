class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :title
      t.datetime :due_date
      t.integer :priority
      t.text :description

      t.timestamps
    end
  end
end

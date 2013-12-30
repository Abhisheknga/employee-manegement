class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.string :task
      t.text :location

      t.timestamps
    end
  end
end

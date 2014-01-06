class AddCountryStateToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :country_code, :string
    add_column :departments, :state_code, :string
  end
end

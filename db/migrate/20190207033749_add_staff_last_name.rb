class AddStaffLastName < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :logs, :staff_first_name, :string
  end
end

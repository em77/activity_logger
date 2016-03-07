class AddLastNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string, :default => nil
  end
end

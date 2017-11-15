class AddNbsToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :nbs, :integer, default: 0
  end
end

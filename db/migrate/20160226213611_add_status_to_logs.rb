class AddStatusToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :status, :integer, default: 0
  end
end

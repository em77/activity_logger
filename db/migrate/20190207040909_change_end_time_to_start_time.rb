class ChangeEndTimeToStartTime < ActiveRecord::Migration
  def change
    rename_column :logs, :end_time, :start_time
  end
end

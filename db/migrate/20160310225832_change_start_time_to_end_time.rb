class ChangeStartTimeToEndTime < ActiveRecord::Migration
  def change
    rename_column :logs, :start_time, :end_time
  end
end

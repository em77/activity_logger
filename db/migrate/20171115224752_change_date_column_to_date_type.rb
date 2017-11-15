class ChangeDateColumnToDateType < ActiveRecord::Migration
  def change
    # Add new column
    add_column :logs, :date_formatted, :date

    # Move data from old column to new column
    Log.all.each do |log|
      log.update(date_formatted: Date.strptime(log.date, '%m-%d-%Y'))
    end

    # Delete old column
    remove_column :logs, :date, :string

    # Rename new column name to old column name
    rename_column :logs, :date_formatted, :date
  end
end

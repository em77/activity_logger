class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :staff_last_name
      t.string :member_first_name
      t.string :member_last_name
      t.integer :duration
      t.string :start_time
      t.integer :education_support
      t.integer :pre_vocational
      t.integer :transitional_employment
      t.integer :intensive_supported_employment
      t.integer :ongoing_supported_employment
      t.integer :psychosocial_rehabilitation
      t.integer :habilitation
      t.integer :family_support
      t.integer :face_to_face
      t.text :activity_log
      t.text :follow_up
      t.timestamps null: false
    end
  end
end

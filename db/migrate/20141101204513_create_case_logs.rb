class CreateCaseLogs < ActiveRecord::Migration
  def change
    create_table :case_logs do |t|
      t.string :patient_name
      t.date :patient_date_of_birth
      # 0 = not known,
      # 1 = male,
      # 2 = female,
      # 4 = not applicable
      t.integer :patient_gender, :default => 0
      t.string :description
      t.string :diagnosis
      t.string :treatment
      t.string :title
      t.string :doctor_id

      t.timestamps
    end
  end
end

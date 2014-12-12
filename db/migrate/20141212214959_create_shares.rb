class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :case_log_id
      t.string :doctor_id

      t.timestamps
    end
  end
end

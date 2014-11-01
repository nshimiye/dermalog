class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :license
      t.string :name
      t.string :email
      t.string :password
      t.string :state
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end

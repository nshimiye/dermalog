class AddShareToCaseLogs < ActiveRecord::Migration
  def change
    add_column :case_logs, :share, :string
  end
end

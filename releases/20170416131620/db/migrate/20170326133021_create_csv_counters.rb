class CreateCsvCounters < ActiveRecord::Migration[5.0]
  def change
    create_table :csv_counters do |t|
      t.string :name
      t.string :csv_type
      t.timestamps
    end
  end
end

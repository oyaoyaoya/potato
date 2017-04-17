class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :school_type, default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end

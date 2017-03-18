class CreateSourceFaculties < ActiveRecord::Migration[5.0]
  def change
    create_table :source_faculties do |t|
      t.string :name

      t.timestamps
    end
  end
end

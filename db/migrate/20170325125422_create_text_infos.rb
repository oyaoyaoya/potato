class CreateTextInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :text_infos do |t|
      t.text :info
      t.string :name
      t.references :course, foreign_key: true
      t.timestamps
    end
  end
end

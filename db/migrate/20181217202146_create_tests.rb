class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.belongs_to :test_family, index: true, foreign_key: true
      t.string :level
      t.string :information

      t.timestamps
    end
  end
end

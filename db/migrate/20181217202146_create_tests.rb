class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.belongs_to :test_family, index: true, foreign_key: {on_delete: :cascade}
      t.string :level
      t.string :information
      t.boolean :student_test
      t.timestamps
    end
  end
end
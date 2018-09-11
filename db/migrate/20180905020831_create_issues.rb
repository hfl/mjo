class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.references :journal, foreign_key: true
      t.string :volume
      t.string :number
      t.string :year

      t.timestamps
    end
  end
end

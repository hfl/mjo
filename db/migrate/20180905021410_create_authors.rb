class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.references :article, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :unit
      t.text :introduce
      t.string :order

      t.timestamps
    end
  end
end

class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :journal, foreign_key: true
      t.string :email
      t.string :telephone
      t.string :addr

      t.timestamps
    end
  end
end

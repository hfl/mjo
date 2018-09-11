class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.references :article, foreign_key: true
      t.string :keyword

      t.timestamps
    end
  end
end

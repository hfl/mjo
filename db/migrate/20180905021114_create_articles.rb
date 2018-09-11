class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :issue, foreign_key: true
      t.string :title
      t.text :abstract

      t.timestamps
    end
  end
end

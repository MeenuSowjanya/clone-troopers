class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.references :folder, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.timestamps
    end
  end
end

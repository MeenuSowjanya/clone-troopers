class CreateFolders < ActiveRecord::Migration[6.1]
  def change
    create_table :folders do |t|
      t.string :name
      t.text :description
      t.references :category, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.timestamps
    end
  end
end

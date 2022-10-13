class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :description
      t.references :ticket, null: false, foreign_key: {on_delete: :cascade, on_update: :cascade}

      t.timestamps
    end
  end
end

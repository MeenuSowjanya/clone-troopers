# frozen_string_literal: true

class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.text :description
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end

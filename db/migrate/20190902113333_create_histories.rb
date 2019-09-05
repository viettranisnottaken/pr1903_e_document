# frozen_string_literal: true

class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.references :document, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end

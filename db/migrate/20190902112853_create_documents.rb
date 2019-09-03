# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :file_name
      t.text :description
      t.references :user, foreign_key: true
      t.boolean :checked

      t.timestamps
    end
  end
end

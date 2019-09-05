# frozen_string_literal: true

class CreateCategoryRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :category_relationships do |t|
      t.references :category, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end

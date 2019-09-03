# frozen_string_literal: true

class CreateFollowRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_relationships do |t|
      t.integer :following_id
      t.integer :followed_id

      t.timestamps
    end
  end
end

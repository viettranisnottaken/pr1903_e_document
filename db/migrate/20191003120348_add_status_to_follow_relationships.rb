class AddStatusToFollowRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :follow_relationships, :status, :string
  end
end

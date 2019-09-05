class RemoveAuthorFromDocuments < ActiveRecord::Migration[5.2]
  def change
    remove_column :documents, :author
  end
end

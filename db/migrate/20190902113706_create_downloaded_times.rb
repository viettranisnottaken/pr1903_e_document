# frozen_string_literal: true

class CreateDownloadedTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :downloaded_times do |t|
      t.references :document, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end

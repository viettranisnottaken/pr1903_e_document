# frozen_string_literal: true

class Document < ApplicationRecord
  has_many :category_relationships
  has_many :comments
  has_many :downloaded_times
  has_many :favorites
  has_many :histories
  has_many :users, through: :histories

  has_one_attached :file_name

  belongs_to :user
end

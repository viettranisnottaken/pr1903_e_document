# frozen_string_literal: true

class Document < ApplicationRecord
  has_many :category_relationships
  has_many :comments
  has_many :downloaded_times
  has_many :favorites
  has_many :histories

  belongs_to :user
end

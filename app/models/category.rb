# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :category_relationships
  has_many :documents, through: :category_relationships
end

# frozen_string_literal: true

class Document < ApplicationRecord
  has_many :category_relationships
  has_many :categories, through: :category_relationships
  has_many :comments
  has_many :downloaded_times
  has_many :downloaders, through: :downloaded_times, source: :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  has_many :histories
  has_many :users, through: :histories

  has_one_attached :file_name

  belongs_to :user

  acts_as_paranoid

  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if file_name.attached? && !file_name.content_type.in?(%w(application/pdf))
      file_name.purge
      errors.add(:file_name, 'Must be a PDF file')
    end
  end

end

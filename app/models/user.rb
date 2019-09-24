# frozen_string_literal: true

class User < ApplicationRecord
  has_many :comments
  has_many :documents
  has_many :favorites
  has_many :follow_relationships
  has_many :histories
  has_many :viewed_documents, through: :histories, class_name: "Document"
  has_many :downloaded_times
  has_many :requests

  has_one_attached :avatar

  acts_as_paranoid

  validates :name, presence: true, length: {maximum: 100}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 120},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

end

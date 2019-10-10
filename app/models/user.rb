# frozen_string_literal: true

class User < ApplicationRecord
  has_many :comments
  has_many :documents
  has_many :favorites
  has_many :favorite_documents, through: :favorites, source: :document
  has_many :follow_relationships
  has_many :histories
  has_many :viewed_documents, through: :histories, source: :document
  has_many :downloaded_times
  has_many :downloaded_documents, through: :downloaded_times, source: :document
  has_many :requests

  has_many :active_relationships, class_name: "FollowRelationship",
                                foreign_key: :following_id,
                                dependent: :destroy
  has_many :followed, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "FollowRelationship",
                                 foreign_key: :followed_id,
                                 dependent: :destroy
  has_many :following, through: :passive_relationships, source: :following

  has_many :active_friends, -> {where(status: "accepted")},
                            class_name: "FollowRelationship",
                            foreign_key: :following_id
  has_many :followed_friends, through: :active_friends, source: :followed
  has_many :passive_friends, -> {where status: "accepted"},
                             class_name: "FollowRelationship",
                             foreign_key: :followed_id
  has_many :following_friends, through: :passive_friends, source: :following


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

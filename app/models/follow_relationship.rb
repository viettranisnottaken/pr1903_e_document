# frozen_string_literal: true

class FollowRelationship < ApplicationRecord
  scope :not_yet_accepted, -> { where.not(status: "accepted") }

  belongs_to :following, class_name: "User"
  belongs_to :followed, class_name: "User"
end

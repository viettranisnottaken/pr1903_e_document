# frozen_string_literal: true

class FollowRelationship < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :followed, class_name: "User"
end

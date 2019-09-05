# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :document
  belongs_to :user
end

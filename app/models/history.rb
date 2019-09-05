# frozen_string_literal: true

class History < ApplicationRecord
  belongs_to :document
  belongs_to :user
end

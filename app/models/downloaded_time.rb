# frozen_string_literal: true

class DownloadedTime < ApplicationRecord
  belongs_to :document
  belongs_to :user
end

class Request < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true,
                      uniqueness: {message: "You have already sent your request"}
end

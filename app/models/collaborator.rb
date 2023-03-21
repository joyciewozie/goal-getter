class Collaborator < ApplicationRecord
  belongs_to :goal
  belongs_to :user

  validates :user, uniqueness: { message: "You have already added this user" }
end

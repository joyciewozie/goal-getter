class Collaborator < ApplicationRecord
  belongs_to :goal
  belongs_to :user

<<<<<<< HEAD
  validates :user, uniqueness: { scope: :goal, message: "You have already added this user." }
=======
  validates :user, uniqueness: { message: "You have already added this user" }
>>>>>>> seeding
end

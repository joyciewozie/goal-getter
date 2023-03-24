class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goals, dependent: :destroy
  has_many :comments

  GENDER = ['Fairy', 'Female', 'Male', 'Non-binary', 'Transgender', 'Prefer not to say']

  validates :name, :email, :password, :gender, :city, presence: true
  validates :gender, inclusion: { in: GENDER }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_plants, class_name: "Plant", foreign_key: "user_id"
  has_many :bookings
  has_many :plants, through: :bookings
  has_many :reviews
end

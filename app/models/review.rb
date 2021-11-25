class Review < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  validates :rating, inclusion: { in: 0..5, message: 'should be between 0 to 5' }
  validates :rating, presence: { message: 'cannot be blank' }
  validates :rating, numericality: { only_integer: true, message: 'should be a number' }
  validates :content, presence: true
end

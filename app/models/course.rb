class Course < ActiveRecord::Base
  belongs_to :user
  has_many :comment
  has_many :rating

  validates :coursename, presence: true
  validates :teacher, presence: true
  validates :credits, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

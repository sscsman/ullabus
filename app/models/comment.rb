class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :course, foreign_key: "courseid"

  validates :message, presence: true
end

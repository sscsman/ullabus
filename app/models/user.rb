class User < ActiveRecord::Base
  has_many :course, foreign_key: "creator"
  has_many :comment, foreign_key: "usersid"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end

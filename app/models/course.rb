class Course < ActiveRecord::Base
  belongs_to :user
  has_many :lessons
  has_many :saves

  validates :user, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end

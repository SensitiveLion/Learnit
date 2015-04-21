class Course < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :lessons, dependent: :destroy
  has_many :saves
  has_one :search

  validates :user, presence: true
  validates :category, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end

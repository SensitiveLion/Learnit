class Lesson < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :course, presence: true
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :outside_links, presence: true
end

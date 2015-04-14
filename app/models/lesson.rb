class Lesson < ActiveRecord::Base
  belongs_to :course

  validates :course, presence: true
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: { minimum: 64 }
  validates :outside_links, presence: true, url: true
end

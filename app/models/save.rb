class Save < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :course_id, presance: true
  validates :user_id, presance: true
end

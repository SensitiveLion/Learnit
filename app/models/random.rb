class Random < ActiveRecord::Base
  validates :entry, presence: true
end

class Thing < ActiveRecord::Base
  validates :entry, presence: true
end

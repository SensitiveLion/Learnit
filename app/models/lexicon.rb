class Lexicon < ActiveRecord::Base
  has_many :lexiconlessons, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end

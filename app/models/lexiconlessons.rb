class LexiconLesson < ActiveRecord::Base
  belongs_to :lexicon

  validates :lexicon, presence: true
  validates :body, presence: true
end

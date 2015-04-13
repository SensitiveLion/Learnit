class User < ActiveRecord::Base
  has_many :saves
  has_many :courses

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

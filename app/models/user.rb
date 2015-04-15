class User < ActiveRecord::Base
  has_many :courses
  has_many :saves

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

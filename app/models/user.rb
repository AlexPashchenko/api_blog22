class User < ApplicationRecord
  extend Enumerize

  has_many :posts
  has_many :comments
  has_many :platforms

  validates :name, :login, :email, :password, :role, :age, presence: true
  validates :email, confirmation: true, uniqueness: true
  validates_numericality_of :age,  only_integer: true
  enumerize :role, in: [:admin, :guest], default: :guest
  validates_associated :posts, :comments, :platforms
end

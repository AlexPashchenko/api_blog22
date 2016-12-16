class Category < ApplicationRecord
  has_many :posts

  validates :name, presence: true, uniqueness: true
  validates_associated :posts

end

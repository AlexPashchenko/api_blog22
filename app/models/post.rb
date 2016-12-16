class Post < ApplicationRecord
  extend Enumerize

  has_many :comments
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  scope :approved, -> {where(status: 'approved')}
  scope :unapproved, -> { where(status: 'unapproved')}

  validates :text, :user_id, :category_id, :status, presence: true
  enumerize :status, in: [:approved, :unapproved], default: :unapproved
  validates_associated :comments
end

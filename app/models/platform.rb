class Platform < ApplicationRecord
  belongs_to :user
  has_many :devises

  validates :platform_name, :user_id, presence: true

end

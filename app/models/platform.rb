class Platform < ApplicationRecord
  belongs_to :user
  has_many :devises

  validates :platform_name, :user_id, presence: true

  def check_platform?
    self.platform_name.present?
  end

end

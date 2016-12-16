class Devise < ApplicationRecord
  belongs_to :platform, optional: true
  before_validation :generate_token

  validates :token, :devise_name, :platform_id, presence: true
  validates :token, uniqueness: true

  def generate_token
    return if self.token.present?
    loop do
      token_candidate = SecureRandom.hex
      unless Devise.where(token: token_candidate).exists?
        self.token = token_candidate
        break
      end
    end
  end

end

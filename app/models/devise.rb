class Devise < ApplicationRecord
  belongs_to :platform, optional: true
  belongs_to :user
  before_save :generate_token

  validates :token, :devise_name, :platform_id, presence: true
  validates :token, uniqueness: true

  def generate_token
    new_token = SecureRandom.hex
    self.token= new_token
  end

  def check_devise_name?
    self.devise_name.present?
  end

  def check_token?
    self.token.present?
  end


end

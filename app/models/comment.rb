class Comment < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user, optional: true

  validates :text, :user_id, :post_id, presence: true
end

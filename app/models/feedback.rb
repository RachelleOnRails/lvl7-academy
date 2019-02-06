class Feedback < ApplicationRecord
  belongs_to :user

  validates :title, :email_address, :importance, presence: true
  validates :description, length: { minimum: 25 }

end

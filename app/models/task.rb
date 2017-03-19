class Task < ApplicationRecord
  belongs_to :user

  validates :description, presence: true, length: { maximum: 500 }
  validates :person, presence: true
  validates :status, presence: true
end

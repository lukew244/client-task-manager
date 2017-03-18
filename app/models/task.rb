class Task < ApplicationRecord
  validates :description, presence: true, length: { maximum: 500 }
  validates :person, presence: true


end

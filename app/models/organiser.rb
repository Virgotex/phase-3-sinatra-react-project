class Organiser < ActiveRecord::Base
  belongs_to :event

  has_many :events

  # Validations
  validates :name, presence: true
  validates :email, presence: true
end

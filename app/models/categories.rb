class Category < ActiveRecord::Base
  has_many :events

  # Validations
  validates :name, presence: true
end

class User < ActiveRecord::Base
  has_many :events

  # Validations
  validates :name, presence: true
  validates :email, presence: true
end

class Registration < ActiveRecord::Base
  attr_accessor :email
  belongs_to :event
  belongs_to :user
  # Validations
  validates :name, presence: true
  validates :email, presence: true


  attr_accessor :status
end

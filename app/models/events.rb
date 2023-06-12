class Event < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :organiser
  has_many :organisers
  has_many :registrations

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true
end

class Session < ActiveRecord::Base
  belongs_to :student

  validates :date, presence: true
  validates :minutes, presence: true, numericality: {
    only_integer: true,
    greater_than: 0
  }
  validates :notes, presence: true, length: { minimum: 4 }
end

class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0, message: "is not a whole number!" }
  validates :cuteness, presence: true
  validates :softness, presence: true

end

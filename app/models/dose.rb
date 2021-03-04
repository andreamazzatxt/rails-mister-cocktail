class Dose < ApplicationRecord
  validates :description, presence: true
  belongs_to :ingredient
  belongs_to :cocktail
  validates  :ingredient, uniqueness: {
    scope: :cocktail
  }
end

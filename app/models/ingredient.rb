class Ingredient < ApplicationRecord
  validates :name, uniqueness: true, presence:true
  has_many :doses
  has_many :cocktails, through: :dose
end

class Restaurant < ApplicationRecord
  # escrevi manualmente apos criar o modelo de review
  has_many :reviews, dependent: :destroy # quando apaga um restaurante apaga todas as reviews dele
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true

  validates :category, inclusion: { in: CATEGORIES }

end

class Character < ApplicationRecord
  belongs_to :novel

  validates :character_text, length: { maximum: 2000 }
end

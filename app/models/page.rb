class Page < ApplicationRecord
  validates :slug, uniqueness: { case_sensitive: false }
  validates :title, :description, :slug, :h1, :content, :priority, length: { minimum: 1 }

  validates :published_at, presence: true
  validates :priority, numericality: { only_integer: true }
end

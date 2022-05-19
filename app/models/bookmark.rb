class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :list_id, uniqueness: { scope: :movie_id }
  validates :comment, { presence: true, length: { minimum: 6 } }
end

class Journal < ApplicationRecord
  validates :name, :about, :issn, presence: true
  validates :issn, uniqueness: true
  has_many :issues
end

class Issue < ApplicationRecord
  belongs_to :journal
  has_many :articles
  has_one_attached :cover
end

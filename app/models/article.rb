class Article < ApplicationRecord
  belongs_to :issue
  has_many :authors
  has_many :keywords
  has_one_attached :paper
end

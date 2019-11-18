class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  belongs_to :publisher

  validates :title, :isbn, :year, :price, :buy, :exceprt, :format, :pages, presence: true
end

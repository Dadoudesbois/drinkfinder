class Bar < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :bars, through: :offers
end

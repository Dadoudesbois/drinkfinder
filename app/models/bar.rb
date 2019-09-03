class Bar < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :bars, through: :offers
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

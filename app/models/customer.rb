class Customer < ApplicationRecord
  validates :full_name, :phone_number, presence: true
  has_one_attached :image
end

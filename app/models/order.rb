class Order < ApplicationRecord
  belongs_to :client
  has_many :pre_orders, dependent: :destroy
  has_many :reviews, dependent: :destroy

  enum category: %i[3d_grafic architecture consulting outsource web_development video graphics programming other]
  enum status: %i[good finished]
end

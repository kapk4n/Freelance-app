class Order < ApplicationRecord
  belongs_to :client
  has_many :pre_orders, dependent: :destroy
  has_many :reviews, dependent: :destroy

  enum status: %i[good finished]
end

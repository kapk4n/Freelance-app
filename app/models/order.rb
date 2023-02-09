class Order < ApplicationRecord
  belongs_to :client
  has_many :reviews, dependent: :destroy
end

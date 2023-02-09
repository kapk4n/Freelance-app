class Review < ApplicationRecord
  belongs_to :freelancer
  belongs_to :order
end

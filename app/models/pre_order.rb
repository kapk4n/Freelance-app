class PreOrder < ApplicationRecord
  belongs_to :order
  belongs_to :freelancer
end

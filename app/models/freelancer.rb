class Freelancer < ApplicationRecord
  belongs_to :user
  has_many :pre_orders, dependent: :destroy
  has_many :reviews, dependent: :destroy

  enum category: %i[3d_grafic architecture consulting outsource web_development video graphics programming other]
  enum status: %i[free so-so busy]
  enum experienc: %i[0 1-3 3-5 5+]

end

class User < ApplicationRecord
  has_secure_password
  has_many :clients, dependent: :destroy
  has_many :freelancers, dependent: :destroy

  enum role: %i[client freelancer admin]
  enum sex: %i[male female other]


end

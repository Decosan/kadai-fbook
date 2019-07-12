class User < ApplicationRecord
  has_secure_password
  before_validation {email.downcase!}
  validates :name, :presence true,length:{maximum: 25}
  validates :email, :presence true,length:{maximum: 25},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
end

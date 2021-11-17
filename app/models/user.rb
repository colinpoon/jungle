class User < ActiveRecord::Base
  has_secure_password
# change fields for tests
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
end
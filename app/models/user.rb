class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, format: { with: /\A.+@.+$\Z/ }, uniqueness: true
  validates :name, presence: true, uniqueness: true
end

class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates_presence_of :password, :role

  enum role: {"Restaurant" => 1,
              "Sales Rep" => 2,
              "Admin" => 3}
end

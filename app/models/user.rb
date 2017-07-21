class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates_presence_of :password, :role

  enum role: ["Default", "Restaurant", "Sales Rep", "Admin"]

  has_many :restaurants
  has_many :sales_reps
end

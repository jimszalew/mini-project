class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates_presence_of :password

  def role
    UserRole.find_by(user_id: self.id).role
  end
end

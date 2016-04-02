class User < ActiveRecord::Base
  has_many :interactions, dependent: :destroy
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  
  has_secure_password

  def as_json
    return {
      username: @username
    }
  end
end

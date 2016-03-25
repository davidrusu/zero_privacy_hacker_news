class User < ActiveRecord::Base
  has_many :interactions, dependent: :destroy
  
  validates :name, presence: true
end

require 'securerandom'

class Session < ActiveRecord::Base
  belongs_to :user
  validates :session_id, presence: true
  validates :session_id, uniqueness: true
  validates_datetime :expires, :after => :now

  def self.create_session(user)
    Session.transaction do
      uuid = SecureRandom.uuid
      until Session.find_by(session_id: uuid).nil? do
        uuid = SecureRandom.uuid
      end
      
      session = Session.new(
        session_id: uuid,
        user: user,
        expires: DateTime.current.utc() + 10.days # sessions will last 10 days
      )
      
      session.save!
      return session.session_id
    end
  end

  def self.get_user(session_id)
    session = Session.find_by session_id: session_id
    if session.nil?
      return nil
    else
      return session.user
    end
  end
  
  def as_json
    return @session_id
  end
end

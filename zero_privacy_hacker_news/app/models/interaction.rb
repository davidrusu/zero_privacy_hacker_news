# This model stores a log of every interaction a user has with the site.
# Everytime a user views a story, or comment etc.. an interaction is logged.
# These are later made visible by everyone who accesses the site
class Interaction < ActiveRecord::Base
  belongs_to :user

  validates :hn_item, presence: true
  validates :user_id, presence: true
end

class Comment < ActiveRecord::Base
  include ModelSupport

  has_many :users, class_name: "User"
  has_many :events, class_name: "Event"

  validates :note, presence: true

end
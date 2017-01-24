class Event < ActiveRecord::Base
  include ModelSupport

  validates :name, presence: true, length: { in: 1..20 }
  validates :purpose, length: { in: 10..200 }
  validates :place, length: { in: 5..50 }
  validate :event_date_cant_be_in_past

  has_and_belongs_to_many :users, join_table: :events_users
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  accepts_nested_attributes_for :users
  has_many :comments, class_name: "Comment"

  mount_uploaders :files, EventFileUploader

  def event_date_cant_be_in_past
    if date_time.present? && date_time < Date.today
      errors.add(:date_time, "can't be in the past")
    end
  end

end

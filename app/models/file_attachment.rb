class FileAttachment < ActiveRecord::Base
  belongs_to :event

  mount_uploader :file, EventFileUploader
end
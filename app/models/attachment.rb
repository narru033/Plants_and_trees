class Attachment < ActiveRecord::Base

  belongs_to :user
  has_attached_file :photo, :styles => { :medium => "300x300>" }
  validates_attachment :photo, content_type: { content_type: /\Aimage\/.*\Z/ }

end

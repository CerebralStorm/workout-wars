class ExperienceSource< ActiveRecord::Base
  belongs_to :user
  belongs_to :experienceable, polymorphic: true

  validates_presence_of :user_id
  validates_presence_of :experienceable_id
  validates_presence_of :experienceable_type
end
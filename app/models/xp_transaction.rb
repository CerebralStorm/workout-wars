class XpTransaction < ActiveRecord::Base
  belongs_to :xp_source, polymorphic: true

  validates_presence_of :user_id
  validates_presence_of :xp_source_id
  validates_presence_of :xp_source_type
end
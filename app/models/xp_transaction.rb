class XpTransaction < ActiveRecord::Base
  belongs_to :xp_source, polymorphic: true
end
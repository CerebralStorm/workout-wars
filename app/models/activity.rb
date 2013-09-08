class Activity < ActiveRecord::Base
  belongs_to :workout

  validates_presence_of :name
end

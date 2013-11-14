class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :registerable, polymorphic: true
end

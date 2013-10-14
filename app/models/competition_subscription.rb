class CompetitionSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :competition

  #validates_presence_of :user_id
  validate :user_or_team
  validates_presence_of :competition_id

  def user_or_team
    if user_id.nil? && team_id.nil?
      errors.add(:user_id, "Must have a user")
      errors.add(:team_id, "Must have a team")
    end
  end
end

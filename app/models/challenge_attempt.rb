class ChallengeAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  def self.default_scope
    order('completion_time ASC')
  end
end

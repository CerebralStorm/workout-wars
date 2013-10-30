class ChallengeAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  def self.default_scope
    order('completion_time ASC')
  end

  def formatted_completition_time
    Time.at(completion_time).utc.strftime("%H:%M:%S")
  end
end

class ChallengeAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  validates_presence_of :user_id
  validates_presence_of :challenge_id


  def self.default_scope
    order('completion_time ASC')
  end

  def formatted_completition_time
    time = self.completion_time.nil? ? 0 : self.completion_time
    Time.at(time).utc.strftime("%H:%M:%S")
  end
end

class StaticController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
  end

  def leaderboard
    @exercise_types = ExerciseType.all
  end

  def suggestions
  end

  def help
  end
end

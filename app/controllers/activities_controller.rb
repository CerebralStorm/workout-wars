class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:update, :destroy]

  def create
  end

  def update
  end

  def destroy
  end

private
  
  def set_activity
    @activity = Workout.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :reps, :sets, :duration, :distance)
  end

end

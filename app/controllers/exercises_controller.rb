class ExercisesController < ApplicationController
  respond_to :json

  def new
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    @exercise.save
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
  end

private
  
  def exercise_params
    params.require(:exercise).permit(:exercise_type_id, :reps, :distance, :duration, :weight, :calories)
  end
end

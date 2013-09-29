class ExercisesController < ApplicationController

  def new
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    @exercise.save
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

private
  
  def exercise_params
    params.require(:exercise).permit(:exercise_type_id, :reps, :distance, :duration, :weight, :calories)
  end
end

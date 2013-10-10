class CompetitionExercisesController < ApplicationController
  def create
    @competition_exercise = CompetitionExercise.create(competition_exercise_params)
    respond_to do |format|
      if @competition_exercise.save
        format.html { redirect_to @competition_exercise.competition, notice: 'Exercise Succesfully Added' }
        format.json { render action: 'show', status: :created, location: @competition_exercise.competition }
      else
        redirect_to :back
      end
    end
  end

  def destroy
    @competition_exercise = CompetitionExercise.find(params[:id])
    @competition = @competition_exercise.competition
    @competition_exercise.destroy
    respond_to do |format|
      format.html { redirect_to @competition }
      format.json { head :no_content }
    end
  end

private

  def competition_exercise_params
    params.require(:competition_exercise).permit(:competition_id, :exercise_type_id, :limit, :_destroy)
  end
end

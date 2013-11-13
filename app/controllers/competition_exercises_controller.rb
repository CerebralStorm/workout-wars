class CompetableExercisesController < ApplicationController
  def create
    @competable_exercise = CompetitionExercise.create(competable_exercise_params)
    respond_to do |format|
      if @competable_exercise.save
        format.html { redirect_to @competable_exercise.competition, notice: 'Exercise Succesfully Added' }
        format.json { render action: 'show', status: :created, location: @competable_exercise.competition }
      else
        redirect_to :back
      end
    end
  end

  def destroy
    @competable_exercise = CompetitionExercise.find(params[:id])
    @competition = @competable_exercise.competition
    @competable_exercise.destroy
    respond_to do |format|
      format.html { redirect_to @competition }
      format.json { head :no_content }
    end
  end

private

  def competable_exercise_params
    params.require(:competable_exercise).permit(:competition_id, :exercise_type_id, :limit, :_destroy)
  end
end

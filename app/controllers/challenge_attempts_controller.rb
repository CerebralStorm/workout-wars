class ChallengeAttemptsController < ApplicationController
  def show
    @attempt = ChallengeAttempt.find(params[:id])
  end

  def create
    @attempt = ChallengeAttempt.create(challenge_attempt_params)
    respond_to do |format|
      if @attempt.save
        format.html { redirect_to @attempt }
        format.json { render action: 'show', status: :created, location: @attempt }
      else
        redirect_to :back
      end
    end
  end

  def update
    @attempt = ChallengeAttempt.find(params[:id])
    respond_to do |format|
      if @attempt.update(challenge_attempt_params)
        format.html { redirect_to @attempt, notice: 'Challenge attempt was successful.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attempt = ChallengeAttempt.find(params[:id])
    @attempt.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

private
  
  def challenge_attempt_params
    params.require(:challenge_attempt).permit(:user_id, :challenge_id, :completion_time)
  end
end

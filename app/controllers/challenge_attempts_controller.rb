class ChallengeAttemptsController < ApplicationController
  def create
    @attempt = ChallengeAttempt.create(challenge_attempt_params)
    respond_to do |format|
      if @attempt.save
        format.html { redirect_to @attempt.challenge, notice: 'Registration successful' }
        format.json { render action: 'show', status: :created, location: @attempt.challenge }
      else
        redirect_to :back
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
    params.require(:challenge_attempt).permit(:user_id, :challenge_id)
  end
end

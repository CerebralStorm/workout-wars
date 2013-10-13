class TeamCompetitionSubscriptionsController < ApplicationController
  def create
    @subscription = TeamCompetitionSubscription.create(team_competition_subscription_params)
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription.team_competition, notice: 'Registration successful' }
        format.json { render action: 'show', status: :created, location: @subscription.team_competition }
      else
        redirect_to :back
      end
    end
  end

  def destroy
    @subscription = TeamCompetitionSubscription.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to team_competitions_url }
      format.json { head :no_content }
    end
  end

private
  
  def team_competition_subscription_params
    params.require(:team_competition_subscription).permit(:team_id, :team_competition_id)
  end
end

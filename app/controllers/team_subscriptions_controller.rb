class TeamSubscriptionsController < ApplicationController
  def create
    @subscription = TeamSubscription.create(team_subscription_params)
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription.team.competition, notice: 'Successfully Joined' }
        format.json { render action: 'show', status: :created, location: @subscription.team.competition }
      else
        redirect_to :back
      end
    end
  end

  def destroy
    @subscription = TeamSubscription.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

private
  
  def team_subscription_params
    params.require(:team_subscription).permit(:user_id, :team_id)
  end
end

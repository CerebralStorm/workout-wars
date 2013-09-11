class CompetitionSubscriptionsController < ApplicationController
  def create
    @subscription = CompetitionSubscription.create(competition_subscription_params)
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription.competition, notice: 'Registration successful' }
        format.json { render action: 'show', status: :created, location: @subscription.competition }
      else
        format.html { render action: 'new' }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subscription = CompetitionSubscription.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url }
      format.json { head :no_content }
    end
  end

private
  
  def competition_subscription_params
    params.require(:competition_subscription).permit(:user_id, :competition_id)
  end
end

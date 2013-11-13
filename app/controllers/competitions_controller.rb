class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  def index
    @competitions = Competition.all
  end

  def show
    @subscription = CompetitionSubscription.find_by user_id: current_user.id, competition_id: @competition.id
    @subscription = CompetitionSubscription.new if @subscription.nil? 
  end

  def new
    @competition = Competition.new
  end

  def edit
  end

  def create
    @competition = Competition.new(competition_params)
    @competition.creator_id = current_user.id

    respond_to do |format|
      if @competition.save
        format.html { redirect_to @competition, notice: 'Competition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @competition }
      else
        format.html { render action: 'new' }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to @competition, notice: 'Competition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_path, notice: 'Competition was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def set_competition
      @competition = Competition.find(params[:id])
    end

    def competition_params
      params.require(:competition).permit(
        :name, :start_date, :end_date, :max_participants, :lower_level_restriction, :upper_level_restriction,
        :difficulty_id, :public, :number_of_teams, :competition_type_id, :team,
        :competition_exercises_attributes => [:id, :competition_id, :exercise_type_id, :limit, :_destroy]
      )
    end
end

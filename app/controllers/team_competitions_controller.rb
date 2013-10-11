class TeamCompetitionsController < ApplicationController
  before_action :set_team_competition, only: [:show, :edit, :update, :destroy]

  # GET /team_competitions
  # GET /team_competitions.json
  def index
    @team_competitions = TeamCompetition.all
  end

  # GET /team_competitions/1
  # GET /team_competitions/1.json
  def show
    @team_competition = TeamCompetitionSubscription.find_by user_id: current_user.id, competition_id: @competition.id
    @team_competition = TeamCompetitionSubscription.new if @subscription.nil?
  end

  # GET /team_competitions/new
  def new
    @team_competition = TeamCompetition.new
  end

  # GET /team_competitions/1/edit
  def edit
  end

  # POST /team_competitions
  # POST /team_competitions.json
  def create
    @team_competition = TeamCompetition.new(team_competition_params)
    @team_competition.creator_id = current_user.id

    respond_to do |format|
      if @team_competition.save
        format.html { redirect_to @team_competition, notice: 'Team competition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team_competition }
      else
        format.html { render action: 'new' }
        format.json { render json: @team_competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_competitions/1
  # PATCH/PUT /team_competitions/1.json
  def update
    respond_to do |format|
      if @team_competition.update(team_competition_params)
        format.html { redirect_to @team_competition, notice: 'Team competition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team_competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_competitions/1
  # DELETE /team_competitions/1.json
  def destroy
    @team_competition.destroy
    respond_to do |format|
      format.html { redirect_to team_competitions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_competition
      @team_competition = TeamCompetition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_competition_params
      params.require(:team_competition).permit(:name, :start_date, :end_date, :competition_type_id, :number_of_team, :lower_level_restriction, :upper_level_restriction, :active, :creator_id, :winner_id)
    end
end

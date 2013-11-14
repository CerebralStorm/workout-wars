class ChallengeTypesController < ApplicationController
  before_action :set_challenge_type, only: [:show, :edit, :update, :destroy]

  # GET /Challenge_types
  # GET /Challenge_types.json
  def index
    @challenge_types = ChallengeType.all
  end

  # GET /Challenge_types/1
  # GET /Challenge_types/1.json
  def show
    respond_to do |format|
      format.html {}
      format.json { render :json => @challenge_type }
    end
  end

  # GET /Challenge_types/new
  def new
    @challenge_type = ChallengeType.new
  end

  # GET /Challenge_types/1/edit
  def edit
  end

  # POST /Challenge_types
  # POST /Challenge_types.json
  def create
    @challenge_type = ChallengeType.new(challenge_type_params)

    respond_to do |format|
      if @challenge_type.save
        format.html { redirect_to @challenge_type, notice: 'Challenge_type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @challenge_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @challenge_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Challenge_types/1
  # PATCH/PUT /Challenge_types/1.json
  def update
    respond_to do |format|
      if @challenge_type.update(challenge_type_params)
        format.html { redirect_to @challenge_type, notice: 'challenge_type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @challenge_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Challenge_types/1
  # DELETE /Challenge_types/1.json
  def destroy
    @challenge_type.destroy
    respond_to do |format|
      format.html { redirect_to challenge_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge_type
      @challenge_type = ChallengeType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_type_params
      params.require(:challenge_type).permit(:name, :category, :xp_multiplier, :use_reps, :use_distance, :use_duration, :use_weight, :use_calories)
    end
end
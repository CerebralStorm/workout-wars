class CompetitionTypesController < ApplicationController
  before_action :set_competition_type, only: [:show, :edit, :update, :destroy]

  # GET /Competition_types
  # GET /Competition_types.json
  def index
    @competition_types = CompetitionType.all
  end

  # GET /Competition_types/1
  # GET /Competition_types/1.json
  def show
    respond_to do |format|
      format.html {}
      format.json { render :json => @competition_type }
    end
  end

  # GET /Competition_types/new
  def new
    @competition_type = CompetitionType.new
  end

  # GET /Competition_types/1/edit
  def edit
  end

  # POST /Competition_types
  # POST /Competition_types.json
  def create
    @competition_type = CompetitionType.new(competition_type_params)

    respond_to do |format|
      if @competition_type.save
        format.html { redirect_to @competition_type, notice: 'Competition_type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @competition_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @competition_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Competition_types/1
  # PATCH/PUT /Competition_types/1.json
  def update
    respond_to do |format|
      if @competition_type.update(competition_type_params)
        format.html { redirect_to @competition_type, notice: 'Competition_type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @competition_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Competition_types/1
  # DELETE /Competition_types/1.json
  def destroy
    @competition_type.destroy
    respond_to do |format|
      format.html { redirect_to competition_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition_type
      @competition_type = CompetitionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_type_params
      params.require(:Competition_type).permit(:name, :category, :xp_multiplier, :use_reps, :use_distance, :use_duration, :use_weight, :use_calories)
    end
end
class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @workouts = @user.workouts
  end

  def show
  end

  def new
    @workout = Workout.new
    @workout.exercises.new
  end

  def edit
  end

  def create
    @workout = @user.workouts.build(workout_params)
    
    respond_to do |format|
      if @workout.save
        format.html { redirect_to user_workouts_path, notice: 'Workout was successfully created.' }
        format.json { render action: 'show', status: :created, location: user_workout_path(@user, @workout) }
      else
        format.html { render action: 'new' }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @workout.update_attributes(workout_params)
        format.html { redirect_to user_workout_path(@user, @workout), notice: 'Workout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to user_workouts_path(@user) }
      format.json { head :no_content }
    end
  end

  private
    def set_workout
      @workout = Workout.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def workout_params
      params.require(:workout).permit(:date, exercises_attributes: [:activity_id, :workout_id, :name, :reps, :sets, :duration, :distance, :_destroy, :weight, :id])
    end
end

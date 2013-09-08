class ActivitiesController < ApplicationController
#   before_action :set_activity, only: [:update, :destroy]
#   before_action :set_workout
#   before_action :set_user

#   def create
#     @activity = @workout.activity.build(activity_params)

#     respond_to do |format|
#       if @activity.save
#         format.html { redirect_to user_workout_path(@user, @workout), notice: 'Workout was successfully created.' }
#         format.json { render action: 'show', status: :created, location: user_workout_path(@user, @workout) }
#       else
#         format.html { render action: 'new' }
#         format.json { render json: @activity.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def update
#     respond_to do |format|
#       if @activity.update(activity_params)
#         format.html { redirect_to user_workout_path(@user, @workout), notice: 'Workout was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: 'edit' }
#         format.json { render json: @workout.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def destroy
#   end

# private

#   def set_user
#     @user = Workout.find(params[:user_id])
#   end
  
#   def set_activity
#     @activity = Workout.find(params[:id])
#   end

#   def set_workout
#     @workout = Workout.find(params[:workout_id])
#   end

#   def activity_params
#     params.require(:activity).permit(:name, :reps, :sets, :duration, :distance)
#   end

end

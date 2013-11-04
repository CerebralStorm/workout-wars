class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
    @exercises = @user.exercises
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def user_exercises
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: @user.exercises_by_exercise_type_id(params[:exercise_type_id]) }
    end
  end

private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation, 
      :address, :phone, :weight, :height, :gender
    )
  end

end

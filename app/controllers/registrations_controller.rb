class RegistrationsController < ApplicationController
  def create
    @registration = Registration.create(registration_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration.registerable, notice: 'Registration successful' }
        format.json { render action: 'show', status: :created, location: @registration.registerable }
      else
        redirect_to :back
      end
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    registerable = @registration.registerable
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registerable }
      format.json { head :no_content }
    end
  end

private
  
  def registration_params
    params.require(:registration).permit(:user_id, :registerable_id, :registerable_type, :team_id)
  end
end

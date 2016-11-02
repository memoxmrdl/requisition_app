class ProfilesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def edit
    @profile = find_profile
    authorize @profile
  end

  def update
    @profile = find_profile
    authorize @profile
    @profile.update(profile_params)

    respond_with @profile, location: -> { edit_profile_path(@profile) }
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :second_name, :second_last_name, :first_last_name, :birth_date,
                                    :curp, :rfc, :gender, :birth_state, :phone_number)
  end

  def find_profile
    Profile.find_by(id: params[:id])
  end
end

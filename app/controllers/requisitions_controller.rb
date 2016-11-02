class RequisitionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flash_missing_profile!, except: [:index, :destroy]

  respond_to :html

  def index
    @requisitions = current_user.requisitions
    authorize @requisitions
  end

  def new
    @requisition = current_user.requisitions.build
    authorize @requisition
    3.times { @requisition.personal_references.build }
  end

  def create
    @requisition = current_user.requisitions.create(requisition_params)
    authorize @requisition

    respond_with @requisition, location: -> { requisitions_path }
  end

  def edit
    @requisition = find_requisition
    authorize @requisition
  end

  def update
    @requisition = find_requisition
    authorize @requisition
    @requisition.update(requisition_params)

    respond_with @requisition, location: -> { requisitions_path }
  end

  def destroy
    @requisition = find_requisition
    authorize @requisition
    @requisition.destroy

    respond_with @requisition, location: -> { requisitions_path }
  end

  private

  def requisition_params
    params.require(:requisition).permit(:income, :address_years, :marital_status, :requested_amout, :payment_terms,
                                        :bank, :comment, :company_name, :company_phone_number, :dependents_number,
                                        :company_position, :has_sgmm, :has_imss, :has_car,
                                        personal_references_attributes: [:id, :first_name, :second_name, :first_last_name,
                                                                         :second_last_name, :cell_phone_number])
  end

  def find_requisition
    current_user.requisitions.find_by(id: params[:id])
  end

  def current_user_profile?
    current_user.profile&.valid?
  end

  def set_flash_missing_profile!
    flash[:alert] = t('messages.missing_profile_html', path: edit_profile_path(current_user.profile)) unless current_user_profile?
  end
end

class RentalHistory
  attr_reader :current_address, :current_date,:current_vacate_reason,
                  :current_landlord_name, :current_landlord_phone,
                  :previous_address, :previous_date, :previous_vacate_reason,
                  :previous_landlord_name, :previous_landlord_phone,
                  :other_address, :other_date, :other_vacate_reason,
                  :other_landlord_name, :other_landlord_phone

  def initialize(current_address, current_date,current_vacate_reason,
                  current_landlord_name, current_landlord_phone,
                  previous_address, previous_date, previous_vacate_reason,
                  previous_landlord_name, previous_landlord_phone,
                  other_address, other_date, other_vacate_reason,
                  other_landlord_name, other_landlord_phone)

    @current_address = current_address
    @current_date = current_date
    @current_vacate_reason = current_vacate_reason
    @current_landlord_name = current_landlord_name
    @current_landlord_phone = current_landlord_phone
    @previous_address = previous_address
    @previous_date = previous_date
    @previous_vacate_reason = previous_vacate_reason
    @previous_landlord_name = previous_landlord_name
    @previous_landlord_phone = previous_landlord_phone
    @other_address = other_address
    @other_date = other_date
    @other_vacate_reason = other_vacate_reason
    @other_landlord_name = other_landlord_name
    @other_landlord_phone = other_landlord_phone
  end

  def self.create(params)
    current_address = params[:current_address]
    current_date = params[:current_date]
    current_vacate_reason = params[:current_vacate_reason]
    current_landlord_name = params[:current_landlord_name]
    current_landlord_phone = params[:current_landlord_phone]
    previous_address = params[:previous_address]
    previous_date = params[:previous_date]
    previous_vacate_reason = params[:previous_vacate_reason]
    previous_landlord_name = params[:previous_landlord_name]
    previous_landlord_phone = params[:previous_landlord_phone]
    other_address = params[:other_address]
    other_date = params[:other_date]
    other_vacate_reason = params[:other_vacate_reason]
    other_landlord_name = params[:other_landlord_name]
    other_landlord_phone = params[:other_landlord_phone]

    return RentalHistory.new(current_address, current_date,current_vacate_reason,
                  current_landlord_name, current_landlord_phone,
                  previous_address, previous_date, previous_vacate_reason,
                  previous_landlord_name, previous_landlord_phone,
                  other_address, other_date, other_vacate_reason,
                  other_landlord_name, other_landlord_phone)
  end
  
end
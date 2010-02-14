class EmploymentHistory
  attr_reader :current_name, :current_address, :current_supervisor_name,
    :current_supervisor_phone, :current_title,
    :previous_name, :previous_address, :previous_supervisor_name,
    :previous_supervisor_phone, :previous_title

  def initialize(current_name, current_address, current_supervisor_name,
    current_supervisor_phone, current_title,
    previous_name, previous_address, previous_supervisor_name,
    previous_supervisor_phone, previous_title)

    @current_name =current_name
    @current_address = current_address
    @current_supervisor_name = current_supervisor_name
    @current_supervisor_phone = current_supervisor_phone
    @current_title = current_title
    @previous_name = previous_name
    @previous_address = previous_address
    @previous_supervisor_name = previous_supervisor_name
    @previous_supervisor_phone = previous_supervisor_phone
    @previous_title = previous_title
  end

  def self.create(params)
    current_name =params[:current_name]
    current_address = params[:current_address]
    current_supervisor_name = params[:current_supervisor_name]
    current_supervisor_phone = params[:current_supervisor_phone]
    current_title = params[:current_title]
    previous_name = params[:previous_name]
    previous_address = params[:previous_address]
    previous_supervisor_name = params[:previous_supervisor_name]
    previous_supervisor_phone = params[:previous_supervisor_phone]
    previous_title = params[:previous_title]
    return EmploymentHistory.new(current_name, current_address, current_supervisor_name,
            current_supervisor_phone, current_title, previous_name, previous_address, previous_supervisor_name,
            previous_supervisor_phone, previous_title)

  end


end
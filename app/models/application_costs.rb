class ApplicationCosts
  attr_reader :first_month, :security_deposit, :credit_check, :other
  def initialize(first_month, security_deposit, credit_check, other)
    @first_month = first_month
    @security_deposit = security_deposit
    @credit_check = credit_check
    @other = other
  end

  def self.create(params)
    first_month = params[:first_month]
    security_deposit = params[:security_deposit]
    credit_check = params[:credit_check]
    other = params[:other]
    return ApplicationCosts.new(first_month, security_deposit, credit_check, other)
  end

end
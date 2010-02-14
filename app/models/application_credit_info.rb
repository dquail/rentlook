class ApplicationCreditInfo
  attr_reader :credit_type, :credit_account, :credit_name, :credit_owed,
    :credit_payment, :loan_owed, :loan_payment

  def initialize(credit_type, credit_account, credit_name, credit_owed,
    credit_payment, loan_owed, loan_payment)

    @credit_type = credit_type
    @credit_account = credit_account
    @credit_name = credit_name
    @credit_owed = credit_owed
    @credit_payment = credit_payment
    @loan_owed = loan_owed
    @loan_payment = loan_payment
   end

  def self.create(params)
    credit_type = params[:credit_type]
    credit_account = params[:credit_account]
    credit_name = params[:credit_name]
    credit_owed = params[:credit_owed]
    credit_payment = params[:credit_payment]
    loan_owed = params[:loan_owed]
    loan_payment = params[:loan_payment]
    return ApplicationCreditInfo.new(credit_type, credit_account, credit_name,
        credit_owed, credit_payment, loan_owed, loan_payment)
  end

end
class ApplicationBankInfo
  attr_reader :savings_account, :savings_bank, :savings_branch

  def initialize(savings_account, savings_bank, savings_branch)
    @savings_account = savings_account
    @savings_bank = savings_bank
    @savings_branch = savings_branch
  end

  def self.create(params)
    savings_account = params[:savings_account]
    savings_bank = params[:savings_bank]
    savings_branch = params[:savings_branch]
    return ApplicationBankInfo.new(savings_account, savings_bank, savings_branch)
  end
  
end
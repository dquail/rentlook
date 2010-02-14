class Income
  attr_reader :gross, :other

  def initialize(gross, other)
    @gross = gross
    @other = other
  end
  def self.create(params)
    gross = params[:gross]
    other = params[:other]
    return Income.new(gross, other)
  end
end
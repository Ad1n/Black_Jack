class Bank

  include Validation

  attr_accessor :deposit

  validate :deposit, :type, Integer

  def initialize(deposit = 100)
    @deposit = deposit
    validate!
  end

  def add_money(cash)
    self.deposit += cash
  end

  def bet(cash)
    self.deposit -= cash
  end
end

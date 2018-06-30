class Bank

  attr_accessor :deposit

  def initialize(deposit = 100)
    @deposit = deposit
  end

  def add_money(cash)
    self.deposit += cash
  end

  def bet(cash)
    self.deposit -= cash
  end
end

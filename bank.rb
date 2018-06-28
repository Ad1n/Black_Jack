class Bank

  attr_accessor :player_deposit, :dealer_deposit

  def initialize(player_deposit = 100, dealer_deposit = 100)
    @player_deposit = player_deposit
    @dealer_deposit = dealer_deposit
  end

  def add_player_money(cash)
    self.player_deposit += cash
  end

  def add_dealer_money(cash)
    self.dealer_deposit += cash
  end

  def total_bank_money
    self.player_deposit + self.dealer_deposit
  end

end
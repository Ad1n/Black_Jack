class Player < Dealer

  def initialize(bank, player_name)
    super
    @player_name = player_name
  end
end

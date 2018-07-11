class Player < Dealer

  validate :player_name, :presence
  validate :player_name, :format, /^[A-Z]{1}[a-z]{1,10}$/

  def initialize(player_name)
    super
    @player_name = player_name
    validate!
  end
end

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    first_cards = [player1.deck.rank_of_card(0), player2.deck.rank_of_card(0)]
    third_cards = [player1.deck.rank_of_card(2), player2.deck.rank_of_card(2)]
    
    return :mutually_assured_destruction if third_cards.first == third_cards.last
    return :war if first_cards.first == first_cards.last
    :basic
  end
end

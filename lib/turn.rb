class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    return :mutually_assured_destruction if first_and_third_ranks_equal?
    return :war if first_ranks_equal?
    :basic
  end

  private

  def first_ranks_equal?
    first_ranks ||= card_ranks_at(0)

    first_ranks.first == first_ranks.last
  end

  def third_ranks_equal?
    third_ranks ||= card_ranks_at(2)

    third_ranks.first == third_ranks.last
  end

  def first_and_third_ranks_equal?
    first_ranks_equal? && third_ranks_equal?
  end

  def card_ranks_at(index)
    [player1.deck.rank_of_card(index), player2.deck.rank_of_card(index)]
  end
end

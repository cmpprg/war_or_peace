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

  def winner
    case type
    when :basic
      determine_winner_if_type(:basic)
    when :war
      determine_winner_if_type(:war)
    when :mutually_assured_destruction
      'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    end

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
    [ player1.deck.rank_of_card(index), player2.deck.rank_of_card(index) ]
  end

  def compare_ranks(ranks)
    ranks.first <=> ranks.last
  end

  def determine_winner_if_type(type)
    compare_ranks(card_ranks_at(index_at_type(type))) == 1 ? @player1 : @player2
  end

  def index_at_type(type_of_turn)
    type == :basic ? 0 : 2
  end

end

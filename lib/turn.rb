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
    case type
    when :basic
      send_cards_to_spoils_of_war(1)
    when :war
      send_cards_to_spoils_of_war(3)
    when :mutually_assured_destruction
      remove_cards(3)
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
    [ @player1.deck.rank_of_card(index), @player2.deck.rank_of_card(index) ]
  end

  def compare_ranks(ranks)
    ranks.first <=> ranks.last
  end

  def determine_winner_if_type(type)
    reutnr @player1 if compare_ranks(card_ranks_at(index_at_type(type))) == 1
    @player2
  end

  def index_at_type(type_of_turn)
    type == :basic ? 0 : 2
  end

  def players
    [ @player1, @player2 ]
  end

  def send_cards_to_spoils_of_war(quantity)
    quantity.times do
      players.each { |player| @spoils_of_war << player.deck.remove_card }
    end
  end

  def remove_cards(quantity)
    players.each { |player| player.deck.cards.slice!(0, quantity) }
  end

end

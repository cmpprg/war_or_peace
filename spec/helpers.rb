
module Helpers
  def setup_basic_type_turn
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)

    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card3, @card4])
    @deck2 = Deck.new([@card5, @card6, @card7, @card8])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def setup_basic_player_2_victor_type_turn
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)

    @card5 = Card.new(:heart, 'King', 13)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card3, @card4])
    @deck2 = Deck.new([@card5, @card6, @card7, @card8])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def setup_war_type_turn
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)

    @card5 = Card.new(:club, 'Jack', 11)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card3, @card4])
    @deck2 = Deck.new([@card5, @card6, @card7, @card8])

    @player1 = Player.new("Ryan", @deck1)
    @player2 = Player.new("Robert", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def setup_war_player_2_victor_type_turn
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '3', 3)
    @card4 = Card.new(:diamond, 'Jack', 11)

    @card5 = Card.new(:club, 'Jack', 11)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '9', 9)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card3, @card4])
    @deck2 = Deck.new([@card5, @card6, @card7, @card8])

    @player1 = Player.new("Ryan", @deck1)
    @player2 = Player.new("Robert", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def setup_mutually_assured_destruction_type_turn
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)

    @card5 = Card.new(:club, 'Jack', 11)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:club, '9', 9)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card3, @card4])
    @deck2 = Deck.new([@card5, @card6, @card7, @card8])

    @player1 = Player.new("Ryan", @deck1)
    @player2 = Player.new("Robert", @deck2)

    @turn = Turn.new(@player1, @player2)
  end
end

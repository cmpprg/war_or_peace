#check './helpers.rb' file for the setup helper methods

RSpec.describe Turn do
  it "exists" do
    setup_basic_type_turn

    expect(@turn).to be_an_instance_of(Turn)
  end

  it "has readable attributes" do
    setup_basic_type_turn

    expect(@turn.player1).to be(@player1)
    expect(@turn.player2).to be(@player2)
    expect(@turn.spoils_of_war).to eql([])
  end

  it "can determine if it is a :basic type" do
    setup_basic_type_turn

    expect(@turn.type).to eql(:basic)
  end

  it "can determine if it is a :war type if both players 1st cards are valued the same" do
    setup_war_type_turn

    expect(@turn.type).to eql(:war)
  end

  it "can determine if it is a :mutually_assured_destruction type if both players 1st and 3rd cards equal" do
    setup_mutually_assured_destruction_type_turn

    expect(@turn.type).to eql(:mutually_assured_destruction)
  end

  it "does not determine :mutually_assured_destruction type if only the 3rd cards are equal" do
    card1 = Card.new(:heart, 'King', 13)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)

    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:club, '9', 9)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card3, card4])
    deck2 = Deck.new([card5, card6, card7, card8])

    player1 = Player.new("Ryan", deck1)
    player2 = Player.new("Robert", deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).not_to eql(:mutually_assured_destruction)
    expect(turn.type).to eql(:basic)
  end

  it "can determine who the winner of a :basic type turn is" do
    setup_basic_type_turn

    expect(@turn.type).to eql(:basic)
    expect(@turn.player1.deck.rank_of_card(0)).to eql(11)
    expect(@turn.player2.deck.rank_of_card(0)).to eql(8)
    expect(@turn.winner).to eql(@player1)

    setup_basic_player_2_victor_type_turn
    expect(@turn.type).to eql(:basic)
    expect(@turn.player1.deck.rank_of_card(0)).to eql(11)
    expect(@turn.player2.deck.rank_of_card(0)).to eql(13)
    expect(@turn.winner).to eql(@player2)
  end

  # it "can determine who the winner of a :war type turn is" do
  #   setup_war_type_turn
  #
  #   expect(@turn.type).to be(:war)
  #   expect(@turn.player1.deck.rank_of_card(2)).to eql(9)
  #   expect(@turn.player2.deck.rank_of_card(2)).to eql(3)
  #   expect(@turn.winner).to eql(@player1)
  # end
end

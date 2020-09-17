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

  it "can determine if player1 wins a :basic type turn" do
    setup_basic_type_turn

    expect(@turn.type).to eql(:basic)
    expect(@player1.deck.rank_of_card(0)).to eql(11)
    expect(@player2.deck.rank_of_card(0)).to eql(8)
    expect(@turn.winner).to be(@player1)
  end

  it "can determine if player2 wins a :basic type turn" do
    setup_basic_player_2_victor_type_turn

    expect(@turn.type).to eql(:basic)
    expect(@player1.deck.rank_of_card(0)).to eql(11)
    expect(@player2.deck.rank_of_card(0)).to eql(13)
    expect(@turn.winner).to be(@player2)
  end

  it "can determine if player 1 wins a :war type turn is" do
    setup_war_type_turn

    expect(@turn.type).to eql(:war)
    expect(@player1.deck.rank_of_card(2)).to eql(9)
    expect(@player2.deck.rank_of_card(2)).to eql(3)
    expect(@turn.winner).to be(@player1)
  end

  it "can determine if player 2 wins a :war type turn is" do
    setup_war_player_2_victor_type_turn

    expect(@turn.type).to eql(:war)
    expect(@player1.deck.rank_of_card(2)).to eql(3)
    expect(@player2.deck.rank_of_card(2)).to eql(9)
    expect(@turn.winner).to be(@player2)
  end

  it "can return 'No Winner' if :mutually_assured_destruction type turn" do
    setup_mutually_assured_destruction_type_turn

    expect(@turn.type).to eql(:mutually_assured_destruction)
    expect(@player1.deck.rank_of_card(2) == @player2.deck.rank_of_card(2)).to be(true)
    expect(@turn.winner).to eql('No Winner')
  end

  it "can pile up cards into the spoils of war array attribute for a :basic turn" do
    setup_basic_type_turn

    expect(@player1.deck.cards.length).to eql(4)
    expect(@player2.deck.cards.length).to eql(4)
    expect(@player1.deck.cards.first).to be(@card1)
    expect(@player2.deck.cards.first).to be(@card5)
    expect(@turn.spoils_of_war).to eql([])

    @turn.pile_cards

    expect(@player1.deck.cards.length).to eql(3)
    expect(@player2.deck.cards.length).to eql(3)
    expect(@player1.deck.cards).not_to include(@card1)
    expect(@player2.deck.cards).not_to include(@card5)
    expect(@turn.spoils_of_war).to contain_exactly(@card1, @card5)
  end

  it "can pile up cards into the spoils of war arry attribute for a :war turn" do
    setup_war_type_turn

    expect(@player1.deck.cards.length).to eql(4)
    expect(@player2.deck.cards.length).to eql(4)
    expect(@player1.deck.cards[0]).to be(@card1)
    expect(@player1.deck.cards[1]).to be(@card2)
    expect(@player1.deck.cards[2]).to be(@card3)

    expect(@player2.deck.cards[0]).to be(@card5)
    expect(@player2.deck.cards[1]).to be(@card6)
    expect(@player2.deck.cards[2]).to be(@card7)
    expect(@turn.spoils_of_war).to eql([])

    @turn.pile_cards

    expect(@player1.deck.cards.length).to eql(1)
    expect(@player2.deck.cards.length).to eql(1)
    expect(@player1.deck.cards).not_to include(@card1, @card2, @card3)
    expect(@player2.deck.cards).not_to include(@card5, @card6, @card7)
    expect(@turn.spoils_of_war).to contain_exactly(@card1, @card2, @card3, @card5, @card6, @card7)
  end
end

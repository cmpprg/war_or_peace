RSpec.describe Turn do
  before do
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

  it "exists" do
    expect(@turn).to be_an_instance_of(Turn)
  end

  it "has readable attributes" do
    expect(@turn.player1).to be(@player1)
    expect(@turn.player2).to be(@player2)
    expect(@turn.spoils_of_war).to eql([])
  end

  it "can determine if it is a :basic type" do
    expect(@turn.type).to eql(:basic)
  end

  it "can determine if it is a :war type" do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)

    card5 = Card.new(:club, 'Jack', 11)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card3, card4])
    deck2 = Deck.new([card5, card6, card7, card8])

    player1 = Player.new("Ryan", deck1)
    player2 = Player.new("Robert", deck2)

    turn = Turn.new(player1, player2)

    expect(turn.type).to eql(:war)
  end

  it "can determine if it is a :mutually_assured_destruction type" do
    card1 = Card.new(:heart, 'Jack', 11)
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

    expect(turn.type).to eql(:mutually_assured_destruction)
  end
end

RSpec.describe Player do
  before do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  it "exists" do
    expect(@player).to be_an_instance_of(Player)
  end

  it "has readable attributes" do
    expect(@player.name).to eql('Clarisa')
    expect(@player.deck).to eql(@deck)
  end

  it "can determine if they have lost the game" do
    expect(@player.has_lost?).to be(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to be(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to be(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to be(true)
  end
end

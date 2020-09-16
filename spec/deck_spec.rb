RSpec.describe Deck do
  before do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  it "exists" do
    expect(@deck).to be_an_instance_of(Deck)
  end

  it "has readable attributes" do
    expect(@deck.cards).to eql(@cards)
  end

  it "can find the rank of card at index position" do
    expect(@deck.rank_of_card(0)).to eql(12)
    expect(@deck.rank_of_card(2)).to eql(14)
  end
end

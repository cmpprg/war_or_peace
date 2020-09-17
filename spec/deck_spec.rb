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

  it "can return an array of cards whose rank are at or above 11" do
    expect(@deck.high_ranking_cards).to eql([@card1, @card3])
  end

  it "can remove the top card from the deck" do
    expect(@deck.cards).to eql([@card1, @card2, @card3])
    expect(@deck.remove_card).to eql(@card1)
    expect(@deck.cards).to eql([@card2, @card3])
  end

  it "can add a card to the bottom of the deck" do
    expect(@deck.cards).to eql([@card1, @card2, @card3])
    card4 = Card.new(:club, '5', 5)
    @deck.add_card(card4)
    expect(@deck.cards).to eql([@card1, @card2, @card3, card4])
  end

  it "can calculate what percent of the deck are high ranking" do
    expect(@deck.percent_high_ranking).to eql(66.67)
    @deck.remove_card
    expect(@deck.percent_high_ranking).to eql(33.33)
  end

end

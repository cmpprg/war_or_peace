RSpec.describe Card do
  before do
    @card = Card.new(:diamond, 'Queen', 12)
  end

  it "exists" do
    expect(@card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    expect(@card.suit).to eql(:diamond)
    expect(@card.value).to eql('Queen')
    expect(@card.rank).to eql(12)
  end
end

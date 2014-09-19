require 'card'

describe Card do
  let(:card) {Card.new}
  it "cards should have value" do
    expect(card.value.nil?).to be false
  end

  it "cards should have suit" do
    expect(card.suit.nil?).to be false
  end
end
